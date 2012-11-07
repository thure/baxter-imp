Baxter (imp client)
=============

##In development

You can probably tell Baxter isn't ready yet. Watch this repo or follow [@W0lftron](https://twitter.com/W0lftron) for updates!

##About

The Baxter imp is designed to interface with a single instance of the [Baxter web app](https://github.com/thure/baxter-app). It's designed to run on an [Electric Imp](http://electricimp.com).

##Menu

So far there's only one kind of imp you can make:

1. [Trigger (pin1)](#trigger-pin1)

###Trigger (pin1)

Input ports: HTTP In “Trigger”
Output ports: HTTP Out “Response”, HTTP Out “Phone”
Output pins: Digital out (OD & Pull-up) on pin1.

#####Functionality

Trigger (pin1) will receive a JSON of `{"value": 1}` and nothing else in order to give pin1 0.5 seconds of signal. When it has done that, it will send a request to confirm. This also phones home every 4 minutes to make sure the imp and the NAT stay awake. If you disable this, it's possible the imp will become less reliable.

#####Integrating with Baxter-app

In the Electric Imp planner, add one HTTP In node and two HTTP Out nodes and connect thusly:

    Baxter-TRIGGER-pin1-v0.2, HTTP In “Trigger”   -> (automatic endpoint provided)
    Baxter-TRIGGER-pin1-v0.2, HTTP Out “Response” -> PUT, application/json, http://your-baxter-implementation.tld/imp/response
    Baxter-TRIGGER-pin1-v0.2, HTTP Out “Phone”    -> PUT, application/json, http://your-baxter-implementation.tld/imp/phone

##License

Baxter, both app and imp, are released under the MIT license.