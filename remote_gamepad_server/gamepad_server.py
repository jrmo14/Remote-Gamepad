from concurrent import futures

import gamepad_pb2_grpc
import gamepad_pb2
import grpc
import uuid
import os
import grp
import sys
import uinput
import atexit
from gamepad import Gamepad
import socket
import fcntl
import struct
import logging

class GamepadServicer(gamepad_pb2_grpc.GamepadServicer):
    def __init__(self):
        self.gamepads = {}
        self.num_connections = 0

    def InitializeGamepad(self, request, context):
        client_uuid_str = str(uuid.uuid4())
        print(f"Creating client with uuid {client_uuid_str}")
        self.gamepads[client_uuid_str] = Gamepad(uuid=client_uuid_str)
        return gamepad_pb2.ClientID(client_id=client_uuid_str)

    def SendGamepadState(self, request, context):
        client_id = request.client_id.client_id
        print(f"GOT MESSAGE from {client_id}")
        print(f"\tSetting state to {request.leftStick} {request.rightStick} {request.buttons}")
        self.gamepads[client_id].update_gamepad_state(request.leftStick, request.rightStick, request.buttons)
        return request.client_id

    def DestroyGamepad(self, request, context):
        client_id = request.client_id
        self.gamepads[client_id].destroy()
        try:
            del self.gamepad[client_id]
            print(f"Deleted gamepad {client_id}")
        except KeyError:
            print(f"No gamepad exists with id {client_id}")
        return gamepad_pb2.Empty()

    def cleanup(self):
        print(f"Cleaning up {len(self.gamepads)} gamepads")
        for gamepad_id in self.gamepads.keys():
            self.gamepads[gamepad_id].destroy()
            del self.gamepads[gamepad_id]
            print(f"Destroyed gamepad with id ${gamepad_id}")



# From https://stackoverflow.com/a/9267833
def get_ip(iface):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sockfd = sock.fileno()
    SIOCGIFADDR = 0x8915
    ifreq = struct.pack('16sH14s', iface.encode('utf-8'), socket.AF_INET, b'\x00'*14)
    try:
        res = fcntl.ioctl(sockfd, SIOCGIFADDR, ifreq)
    except:
        return None
    ip = struct.unpack('16sH2x4s8x', res)[2]
    sock.close()
    return socket.inet_ntoa(ip)

def run():
    port_num = 50051
    ext_ifaces = [iface for iface in [line.strip().split(":")[0] for line in open("/proc/net/dev", "r").read().split("\n") if ":" in line] if iface[:3] == "wlp" or iface[:3] == "eth"]
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    gp_service= GamepadServicer()
    gamepad_pb2_grpc.add_GamepadServicer_to_server(gp_service, server)
    server.add_insecure_port(f"0.0.0.0:{port_num}")

    server.start()
    print("Server started on:")
    for iface in ext_ifaces:
        print(f"\t{get_ip(iface)}:{port_num}")
    print("Waiting for termination")
    server.wait_for_termination()

if __name__ == "__main__":
    if os.geteuid() != 0:
        print("Must be run as root to create controllers")
        sys.exit(1)
    logging.basicConfig()
    run()
