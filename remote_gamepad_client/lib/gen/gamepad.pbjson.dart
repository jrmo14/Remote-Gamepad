///
//  Generated code. Do not modify.
//  source: gamepad.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ClientID$json = const {
  '1': 'ClientID',
  '2': const [
    const {'1': 'client_id', '3': 1, '4': 1, '5': 9, '10': 'clientId'},
  ],
};

const JoystickState$json = const {
  '1': 'JoystickState',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 1, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 1, '10': 'y'},
  ],
};

const ButtonState$json = const {
  '1': 'ButtonState',
  '2': const [
    const {'1': 'A', '3': 1, '4': 1, '5': 8, '10': 'A'},
    const {'1': 'B', '3': 2, '4': 1, '5': 8, '10': 'B'},
    const {'1': 'X', '3': 3, '4': 1, '5': 8, '10': 'X'},
    const {'1': 'Y', '3': 4, '4': 1, '5': 8, '10': 'Y'},
  ],
};

const GamepadState$json = const {
  '1': 'GamepadState',
  '2': const [
    const {'1': 'leftStick', '3': 1, '4': 1, '5': 11, '6': '.remote_gamepad.JoystickState', '10': 'leftStick'},
    const {'1': 'rightStick', '3': 2, '4': 1, '5': 11, '6': '.remote_gamepad.JoystickState', '10': 'rightStick'},
    const {'1': 'buttons', '3': 3, '4': 1, '5': 11, '6': '.remote_gamepad.ButtonState', '10': 'buttons'},
    const {'1': 'client_id', '3': 4, '4': 1, '5': 11, '6': '.remote_gamepad.ClientID', '10': 'clientId'},
  ],
};

const Empty$json = const {
  '1': 'Empty',
};

