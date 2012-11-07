//Baxter imp
//type: Trigger unit
//pins: {DO: [1]}
//v0.0.2

local output = OutputPort("Response", "string");
local phone = OutputPort("Phone", "string");

function off(){
    hardware.pin1.write(0);
    output.set("{\"triggered\": true}");
}

function phoneHome(){
    phone.set("{\"awake\": true, \"id\": "+hardware.getimpeeid()+"}");
    server.log("I'm still awake.");
    imp.wakeup(240, phoneHome);
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

imp.configure("Baxter-TRIGGER-pin1-v0.2", [TriggerInput("Trigger", "number")], [output, phone]);
server.log("This is Baxter impee "+hardware.getimpeeid()+" signing on.");

phoneHome();