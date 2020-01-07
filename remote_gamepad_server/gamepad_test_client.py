import gamepad_pb2_grpc
import gamepad_pb2
import grpc
import logging

def init_gamepad(stub):
    print('-'*10 + "InitializeGamepad" + "-"*10)
    resp = stub.InitializeGamepad(gamepad_pb2.Empty())
    print("Got response")
    print(f"ID is {resp.client_id}")

def run():
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = gamepad_pb2_grpc.GamepadStub(channel)
        init_gamepad(stub)

if __name__ == "__main__":
    logging.basicConfig()
    run()
