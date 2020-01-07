import 'dart:io';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:grpc/grpc.dart';
import 'package:remote_joystick/gen/gamepad.pbgrpc.dart';

class GamepadClientImpl {
  static final GamepadClientImpl _singleton = new GamepadClientImpl._internal();

  factory GamepadClientImpl() {
    return _singleton;
  }

  GamepadClientImpl._internal();

  ClientChannel _channel;
  GamepadClient _stub;
  String host;
  int port;
  bool connected = false;
  String uuid;

  Future<bool> connect({host = "127.0.0.1", port = 50051}) async {
    if (!connected) {
      this.host = host;
      this.port = port;
      _channel = ClientChannel(host,
          port: port,
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()));
      _stub = GamepadClient(_channel);
      var connectionResult = 1;
      var connectTry = 0;
      while (connectTry < 10) {
        connectionResult = await setUuid();
        if (connectionResult == 0) {
          connected = true;
          debugPrint("Connected, breaking loop");
          break;
        }
        debugPrint(
            "Connection result was: $connectionResult\nRetrying connection");
        _channel = ClientChannel(host,
            port: port,
            options: const ChannelOptions(
                credentials: ChannelCredentials.insecure()));
        connectTry += 1;
      }

      if (connected) {
        debugPrint("Connected to server at $host:$port");
        return true;
      } else {
        _channel.shutdown();
        debugPrint("Failed to connect");
        return false;
      }
    } else {
      debugPrint("Already connected");
      return false;
    }
  }

  bool disconnect() {
    if (connected) {
      _stub.destroyGamepad(ClientID()..clientId = uuid);
      _channel.shutdown();
      connected = false;
      debugPrint("Disconnected from server");
      return true;
    } else {
      debugPrint("Not connected to server");
      return false;
    }
  }

  Future<int> setUuid() async {
    try {
      debugPrint(
          "Trying connection with server on ${_channel.host}:${_channel.port}");
      var idMsg = await _stub.initializeGamepad(Empty());
      uuid = idMsg.clientId;
      debugPrint("Set uuid");
    } catch (error) {
      debugPrint("Caught error");
      debugPrint("Error is: $error");
      if (error is GrpcError) {
        return error.code;
      }
    }
    if (uuid == null) {
      debugPrint("OH FUCK");
      return 1;
    }
    debugPrint("UUID is $uuid");
    return 0;
  }

  void gamepadCallback(
      Offset leftStick, Offset rightStick, List<bool> buttons) {
    if (!connected) throw ("RPC not connected");

    var leftStickMsg = JoystickState()
      ..x = leftStick.dx
      ..y = leftStick.dy;

    var rightStickMsg = JoystickState()
      ..x = rightStick.dx
      ..y = rightStick.dy;

    var buttonMsg = ButtonState()
      ..a = buttons[0]
      ..b = buttons[1]
      ..x = buttons[2]
      ..y = buttons[3];

    var idMsg = ClientID()..clientId = uuid;

    var gamepadMsg = GamepadState()
      ..buttons = buttonMsg
      ..rightStick = rightStickMsg
      ..leftStick = leftStickMsg
      ..clientId = idMsg;

    _stub.sendGamepadState(gamepadMsg);
    debugPrint(
        "Told server that joysticks are\n\t\tx::y\n\tLeft: ${leftStickMsg.x}::${leftStickMsg.y}\n\tRight: ${rightStickMsg.x}::${rightStickMsg.y}");
    debugPrint("Told server that buttons are\n$buttonMsg");
  }
}
