RAGEILE 
===============================================================================
This is a simple task manager. The idea is to have a client server architecture,
and be able to connect to it from any location with different implementations of 
the client. 

The reason I'm driven to create this is that there isn't really something similar
I'd like to use to manage some of my own work. If all goes well, I'm also going
to create a client that can interface to this implementation which is going to 
have the form of a calendar (meaning I'll be able to log my homework :)). 

Current Interface Manual [Fri Dec 30 12:14:54 EST 2011]
-------------------------------------------------------
Currently only the command line interface is supported.

  To run the application, you can run the script run.rb (You can chmod it to 
  executable). Provide the script with the 'cli' argument value (without the
  quotes). 

  This should bring you to the main interface. Type in help and the script
  will present you with a list of commands on what is possible to be done. 

  Currently persistance is not implemented meaning you will lose any stored
  data. Wait till version 1.0 :)

Features
--------
Here are planned features. Don't expect anything accurate here. My time is limited
and features may change! 

Version 0.5
-----------
* [100%] Have the completed CLI interface which will work with the model
* [ 60%] Mocks of GUIs for the qt-ruby interface complete
* [100%] Persistance [Schema standard defined]
* [100%] Documentation re-evaluation
* [100%] CLI manual 

Version 1.0 
-----------
* Functionality of qt GUIs implemented [standalone] 
* Protocol Design Complete
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
* Loading different objects into a proxy and deallocating lesser used one for 
memory optimization
