How to determine the right username and password to use to access the service
=============================================================================

Selecting the right set of credentials to access your service depends on what you want to accomplish:

* Connect to the service as a messaging client, or
* Administer the Service details

================================================
Connecting to your service as a messaging client
================================================

Solace Cloud configures a default set of client credentials when a service is created.  
The client username and password can be found in the *Service Details* page under the *Connect* Tab.
Clicking on any one of the messaging protocol tiles will expand the tile and reveal the client username 
and password to be used to connect to the service with that messaging protocol (Under the heading 'Connection Details'):

Example::

  Username:
  solace-cloud-client

  Password:
  lm3fteg8xxxpa7e9a3uxxv3bcp

  Message VPN:
  msgvpn-8cpgdixxxht

===========================
Administering your service
===========================

Basic service administration can be performed from the Solace Cloud console requiring only 
your Solace Cloud credentials.  

You will need to use the service 'administrator' user credentials to access external tools which allow deeper service administration capabilities.

The service administrator username and password can be found in the *Service Details* page uner the *Management* tab.  Simply click on 
any of the following tiles to reveal the service administrator username and password for respective tool:

* SEMP REST API  
* PubSub+ Manager application
* SolAdmin Desktop application

Example::

  Username
  msgvpn-8cpgxxxotht-admin

  Password
  cxxxke6ft3v5mdxxa23gqnt0q1

