RAGEILE 
---------------------------------------------
This is a simple task manager. The idea is to have a client server architecture,
and be able to connect to it from any location with different implementations of 
the client. 

The reason I'm driven to create this is that there isn't really something similar
I'd like to use to manage some of my own work. If all goes well, I'm also going
to create a client that can interface to this implementation which is going to 
have the form of a calendar (meaning I'll be able to log my homework :)). 

Features
--------
Here are planned features. Don't expect anything accurate here. My time is limited
and features may change! 

Version 0.5
-----------
* Have the completed CLI interface which will work with the model
* Mocks of GUIs for the qt-ruby interface complete
* Persistance [Schema standard defined]
* Documentation re-evaluation
* CLI manual 

Version 1.0 
-----------
* Functionality of qt GUIs implemented [standalone] 
* Protocol Design
* Schema complete, persistance working
* Documentation re-evaluation

Version 2.0 
-----------
* Server implementation complete
* CLI interface for interaction with the server
* Documentation re-evaluation
* Authentication mechanism defined & implemented

Version 2.1
-----------
* Different clients for the server
* Documentation re-evaluation

Version 2.2
-----------
* Task can have other tasks as dependencies.
* Documentation re-evaluation

Version 2.3
-----------
* Loading different objects into a proxy and deallocating lesser used one for memory optimization
