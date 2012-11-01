local output = OutputPort("Response", "string");

function off(){
  hardware.pin1.write(0);
  output.set("{\"triggered\": true}");
}

class TriggerInput extends InputPort {

  pin = null;
  output = null;

  constructor(name, type){
    base.constructor(name, type);
    pin = hardware.pin1;
    pin.configure(DIGITAL_OUT_OD_PULLUP);
    pin.write(0);
  }

  function set(state){
    if(state == 1){
      hardware.pin1.write(1);
      imp.wakeup(0.5, off);
    }
  }
}


imp.configure("Baxter-MOSFET-relay-pin1", [TriggerInput("Trigger", "number")], [output]);