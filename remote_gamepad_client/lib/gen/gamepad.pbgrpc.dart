///
//  Generated code. Do not modify.
//  source: gamepad.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'gamepad.pb.dart' as $0;
export 'gamepad.pb.dart';

class GamepadClient extends $grpc.Client {
  static final _$initializeGamepad = $grpc.ClientMethod<$0.Empty, $0.ClientID>(
      '/remote_gamepad.Gamepad/InitializeGamepad',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ClientID.fromBuffer(value));
  static final _$sendGamepadState =
      $grpc.ClientMethod<$0.GamepadState, $0.ClientID>(
          '/remote_gamepad.Gamepad/SendGamepadState',
          ($0.GamepadState value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ClientID.fromBuffer(value));
  static final _$destroyGamepad = $grpc.ClientMethod<$0.ClientID, $0.Empty>(
      '/remote_gamepad.Gamepad/DestroyGamepad',
      ($0.ClientID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  GamepadClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.ClientID> initializeGamepad($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$initializeGamepad, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ClientID> sendGamepadState($0.GamepadState request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendGamepadState, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> destroyGamepad($0.ClientID request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$destroyGamepad, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GamepadServiceBase extends $grpc.Service {
  $core.String get $name => 'remote_gamepad.Gamepad';

  GamepadServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ClientID>(
        'InitializeGamepad',
        initializeGamepad_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ClientID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GamepadState, $0.ClientID>(
        'SendGamepadState',
        sendGamepadState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GamepadState.fromBuffer(value),
        ($0.ClientID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClientID, $0.Empty>(
        'DestroyGamepad',
        destroyGamepad_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ClientID.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.ClientID> initializeGamepad_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return initializeGamepad(call, await request);
  }

  $async.Future<$0.ClientID> sendGamepadState_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GamepadState> request) async {
    return sendGamepadState(call, await request);
  }

  $async.Future<$0.Empty> destroyGamepad_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ClientID> request) async {
    return destroyGamepad(call, await request);
  }

  $async.Future<$0.ClientID> initializeGamepad(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ClientID> sendGamepadState(
      $grpc.ServiceCall call, $0.GamepadState request);
  $async.Future<$0.Empty> destroyGamepad(
      $grpc.ServiceCall call, $0.ClientID request);
}
