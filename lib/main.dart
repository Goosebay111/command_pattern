void main() {
  ElectronicDevice newDevice = TVRemote.getDevice();
  TurnTVOn onCommand = TurnTVOn(newDevice);
  DeviceButton button = DeviceButton(onCommand);
  button.press();

  TurnTVOff offCommand = TurnTVOff(newDevice);
  button = DeviceButton(offCommand);
  button.press();

  TurnTVUp volUpCommand = TurnTVUp(newDevice);
  button = DeviceButton(volUpCommand);
  button.press();
  button.press();
  button.undo();
  button.undo();
}

class TVRemote {
  static ElectronicDevice getDevice() => Television();
}

class DeviceButton {
  Command command;
  DeviceButton(this.command);

  void press() {
    command.execute();
  }

  void undo() {
    command.undo();
  }
}

abstract class Command {
  void execute();
  void undo();
}

class TurnTVOn implements Command {
  ElectronicDevice theDevice;

  TurnTVOn(this.theDevice);

  @override
  void execute() {
    theDevice.on();
  }

  @override
  void undo() {
    theDevice.off();
  }
}

class TurnTVOff implements Command {
  ElectronicDevice theDevice;

  TurnTVOff(this.theDevice);

  @override
  void execute() {
    theDevice.off();
  }

  @override
  void undo() {
    theDevice.off();
  }
}

class TurnTVUp implements Command {
  ElectronicDevice theDevice;

  TurnTVUp(this.theDevice);

  @override
  void execute() {
    theDevice.volumeUp();
  }

  @override
  void undo() {
    theDevice.volumeDown();
  }
}

class TurnTVDown implements Command {
  ElectronicDevice theDevice;

  TurnTVDown(this.theDevice);

  @override
  void execute() {
    theDevice.volumeDown();
  }

  @override
  void undo() {
    theDevice.volumeUp();
  }
}

abstract class ElectronicDevice {
  void on();
  void off();
  void volumeUp();
  void volumeDown();
}

class Television implements ElectronicDevice {
  int volume = 0;
  @override
  void on() {
    print('TV is on');
  }

  @override
  void off() {
    print('TV is off');
  }

  @override
  void volumeUp() {
    volume++;
    print('TV volume is at $volume.');
  }

  @override
  void volumeDown() {
    volume--;
    print('TV volume is at $volume.');
  }
}
