///
//  Generated code. Do not modify.
//  source: gamepad.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ClientID extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClientID', package: const $pb.PackageName('remote_gamepad'), createEmptyInstance: create)
    ..aOS(1, 'clientId')
    ..hasRequiredFields = false
  ;

  ClientID._() : super();
  factory ClientID() => create();
  factory ClientID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ClientID clone() => ClientID()..mergeFromMessage(this);
  ClientID copyWith(void Function(ClientID) updates) => super.copyWith((message) => updates(message as ClientID));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientID create() => ClientID._();
  ClientID createEmptyInstance() => create();
  static $pb.PbList<ClientID> createRepeated() => $pb.PbList<ClientID>();
  @$core.pragma('dart2js:noInline')
  static ClientID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientID>(create);
  static ClientID _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
}

class JoystickState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('JoystickState', package: const $pb.PackageName('remote_gamepad'), createEmptyInstance: create)
    ..a<$core.double>(1, 'x', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'y', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  JoystickState._() : super();
  factory JoystickState() => create();
  factory JoystickState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoystickState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  JoystickState clone() => JoystickState()..mergeFromMessage(this);
  JoystickState copyWith(void Function(JoystickState) updates) => super.copyWith((message) => updates(message as JoystickState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoystickState create() => JoystickState._();
  JoystickState createEmptyInstance() => create();
  static $pb.PbList<JoystickState> createRepeated() => $pb.PbList<JoystickState>();
  @$core.pragma('dart2js:noInline')
  static JoystickState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoystickState>(create);
  static JoystickState _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class ButtonState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ButtonState', package: const $pb.PackageName('remote_gamepad'), createEmptyInstance: create)
    ..aOB(1, 'A', protoName: 'A')
    ..aOB(2, 'B', protoName: 'B')
    ..aOB(3, 'X', protoName: 'X')
    ..aOB(4, 'Y', protoName: 'Y')
    ..hasRequiredFields = false
  ;

  ButtonState._() : super();
  factory ButtonState() => create();
  factory ButtonState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ButtonState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ButtonState clone() => ButtonState()..mergeFromMessage(this);
  ButtonState copyWith(void Function(ButtonState) updates) => super.copyWith((message) => updates(message as ButtonState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ButtonState create() => ButtonState._();
  ButtonState createEmptyInstance() => create();
  static $pb.PbList<ButtonState> createRepeated() => $pb.PbList<ButtonState>();
  @$core.pragma('dart2js:noInline')
  static ButtonState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ButtonState>(create);
  static ButtonState _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get a => $_getBF(0);
  @$pb.TagNumber(1)
  set a($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get b => $_getBF(1);
  @$pb.TagNumber(2)
  set b($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get x => $_getBF(2);
  @$pb.TagNumber(3)
  set x($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasX() => $_has(2);
  @$pb.TagNumber(3)
  void clearX() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get y => $_getBF(3);
  @$pb.TagNumber(4)
  set y($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasY() => $_has(3);
  @$pb.TagNumber(4)
  void clearY() => clearField(4);
}

class GamepadState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GamepadState', package: const $pb.PackageName('remote_gamepad'), createEmptyInstance: create)
    ..aOM<JoystickState>(1, 'leftStick', protoName: 'leftStick', subBuilder: JoystickState.create)
    ..aOM<JoystickState>(2, 'rightStick', protoName: 'rightStick', subBuilder: JoystickState.create)
    ..aOM<ButtonState>(3, 'buttons', subBuilder: ButtonState.create)
    ..aOM<ClientID>(4, 'clientId', subBuilder: ClientID.create)
    ..hasRequiredFields = false
  ;

  GamepadState._() : super();
  factory GamepadState() => create();
  factory GamepadState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GamepadState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GamepadState clone() => GamepadState()..mergeFromMessage(this);
  GamepadState copyWith(void Function(GamepadState) updates) => super.copyWith((message) => updates(message as GamepadState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamepadState create() => GamepadState._();
  GamepadState createEmptyInstance() => create();
  static $pb.PbList<GamepadState> createRepeated() => $pb.PbList<GamepadState>();
  @$core.pragma('dart2js:noInline')
  static GamepadState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GamepadState>(create);
  static GamepadState _defaultInstance;

  @$pb.TagNumber(1)
  JoystickState get leftStick => $_getN(0);
  @$pb.TagNumber(1)
  set leftStick(JoystickState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLeftStick() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftStick() => clearField(1);
  @$pb.TagNumber(1)
  JoystickState ensureLeftStick() => $_ensure(0);

  @$pb.TagNumber(2)
  JoystickState get rightStick => $_getN(1);
  @$pb.TagNumber(2)
  set rightStick(JoystickState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRightStick() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightStick() => clearField(2);
  @$pb.TagNumber(2)
  JoystickState ensureRightStick() => $_ensure(1);

  @$pb.TagNumber(3)
  ButtonState get buttons => $_getN(2);
  @$pb.TagNumber(3)
  set buttons(ButtonState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasButtons() => $_has(2);
  @$pb.TagNumber(3)
  void clearButtons() => clearField(3);
  @$pb.TagNumber(3)
  ButtonState ensureButtons() => $_ensure(2);

  @$pb.TagNumber(4)
  ClientID get clientId => $_getN(3);
  @$pb.TagNumber(4)
  set clientId(ClientID v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasClientId() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientId() => clearField(4);
  @$pb.TagNumber(4)
  ClientID ensureClientId() => $_ensure(3);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Empty', package: const $pb.PackageName('remote_gamepad'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Empty clone() => Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

