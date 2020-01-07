## Description
Running `gamepad_server.py` will start a gRPC server that creates virtual gamepads controlled by the app in the `remote_gamepad_client` of this repository 

--------------

### Requirements

| Package   | Install command                  		|
|------------------|--------------------------------------------|
| libevdev  	| `pip3 install libevdev`           	|
| grpc      		| `pip3 install grpcio grpcio-tools` |
| shortuuid 	| `pip3 install shortuuid`           	|

Alternatively: `pip3 install -r requirements.txt`

-----------------

### Usage
Run `python3 gamepad_server.py` will start the server
Requires permissions to create gamepads (this can be done by doing `sudo python3 gamepad_server.py`)
