import libevdev as evd
from libevdev import InputEvent
import time

def map_num(num: float, in_min: float, in_max: float, to_min: float, to_max: float) -> float:
    return (num - in_min) * (to_max - to_min) / (in_max - in_min) + to_min



class Gamepad:
    def __init__(self, uuid):
        self._events_state = {"ABS_X": None, "ABS_Y": None, "ABS_RX": None, "ABS_RY": None, "BTN_NORTH": None, "BTN_SOUTH": None, "BTN_EAST": None, "BTN_WEST": None}
        self._axis_min = -32768
        self._axis_max = 32767

        self.device = evd.Device()
        self.device.name = f"gamepad-{uuid}"


        for ev in list(self._events_state.keys())[:4]:
            self.device.enable(evd.evbit(ev), evd.InputAbsInfo(minimum=self._axis_min, maximum=self._axis_max))
        for ev in list(self._events_state.keys())[4:]:
            self.device.enable(evd.evbit(ev))

        self.uinput_node = self.device.create_uinput_device()
        print("New device at {} ({})".format(self.uinput_node.devnode, self.uinput_node.syspath))
        time.sleep(1) # Give everything time to register that the device exists



    def _sync(self):
        events = []
        for ev in self._events_state.keys():
            if self._events_state[ev] is not None:
                events.append(InputEvent(evd.evbit(ev), self._events_state[ev]))
        events.append(InputEvent(evd.EV_SYN.SYN_REPORT, 0))
        self.uinput_node.send_events(events)

    def set_leftstick(self, stick, sync=False):
        self._events_state["ABS_X"] = map_num(stick.x, -1, 1, self._axis_min, self._axis_max)
        self._events_state["ABS_Y"] = map_num(stick.y, -1, 1, self._axis_min, self._axis_max)
        if sync:
            self._sync()

    def set_rightstick(self, stick, sync=False):
        self._events_state["ABS_RX"] = map_num(stick.x, -1, 1, self._axis_min, self._axis_max)
        self._events_state["ABS_RY"] = map_num(stick.y, -1, 1, self._axis_min, self._axis_max)
        if sync:
            self._sync()

    def set_buttons(self, buttons, sync = False):
        self._events_state["BTN_SOUTH"] = buttons.A
        self._events_state["BTN_EAST"] = buttons.B
        self._events_state["BTN_WEST"] = buttons.X
        self._events_state["BTN_NORTH"] = buttons.Y
        if sync:
            self._sync()

    def update_gamepad_state(self, left, right, buttons):
        left_x = map_num(left.x, -1, 1, self._axis_min, self._axis_max)
        left_y = map_num(left.y, -1, 1, self._axis_min, self._axis_max)
        right_x = map_num(right.x, -1, 1, self._axis_min, self._axis_max)
        right_y = map_num(right.y, -1, 1, self._axis_min, self._axis_max)

        self._events_state["ABS_X"] = int(left_x)
        self._events_state["ABS_Y"] = int(left_y)
        self._events_state["ABS_RX"] = int(right_x)
        self._events_state["ABS_RY"] = int(right_y)
        self._events_state["BTN_NORTH"] = 1 if buttons.Y else 0
        self._events_state["BTN_EAST"] = 1 if buttons.B else 0
        self._events_state["BTN_SOUTH"] = 1 if buttons.A else 0
        self._events_state["BTN_WEST"] = 1 if buttons.X else 0

        self._sync()


    def destroy(self):
        del self.uinput_node
        del self.device

