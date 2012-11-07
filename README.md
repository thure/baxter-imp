Baxter (imp client)
=============

##In development

You can probably tell Baxter isn't ready yet. Watch this repo or follow [@W0lftron](https://twitter.com/W0lftron) for updates!

##About

Baxter imps are designed to interface with a single instance of the [Baxter web app](https://github.com/thure/baxter-app).
They are written in [Squirrel](http://squirrel-lang.org) and run on any [Electric Imp](http://electricimp.com).

The Baxter imps here are example files posted for the convenience of makers wanting to use Baxter to automate their home.
Each project will merit special code, so you are encouraged to check the example code and make sure it does what you need it to do.

##Menu

So far there's only one kind of imp in the repository:

1. [Trigger (pin1)](#trigger-pin1)

###Trigger (pin1)

*Input ports:* HTTP In “Trigger”  
*Output ports:* HTTP Out “Response”, HTTP Out “Phone”  
*Output pins:* Digital out (OD & Pull-up) on pin1.

######Functionality

If Trigger (pin1) receives `{"value": 1}` through its “Trigger” port, it writes `1` to pin1 for 0.5 seconds, then writes `0`.
When it has done that, it will send a request to “Response” to confirm it's done.
This also phones home out of “Phone” every 4 minutes to make sure the imp and the NAT stay awake. If you disable this, it's possible the imp will become less reliable.

######Integrating with Baxter-app

In the Electric Imp planner, add one HTTP In node and two HTTP Out nodes and connect thusly:

    Baxter-TRIGGER-pin1-v0.2, HTTP In “Trigger”   -> (automatic endpoint provided)
    Baxter-TRIGGER-pin1-v0.2, HTTP Out “Response” -> PUT, application/json, http://your-baxter-implementation.tld/imp/response
    Baxter-TRIGGER-pin1-v0.2, HTTP Out “Phone”    -> PUT, application/json, http://your-baxter-implementation.tld/imp/phone

##License

Baxter, both app and imp, are themselves released under the [MIT license](http://bureaujs.org/license).
All of Baxter's dependencies are open source, but have their own licenses.