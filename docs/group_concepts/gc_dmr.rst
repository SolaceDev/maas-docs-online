Dynamic Message Routing in PubSub+ Cloud
========================================

In PubSub+ Cloud, all enterprise messaging services are created with the Dynamic Message Routing (DMR) feature enabled. To learn more about DMR,
check out `the official documentation in the Solace Tech Docs <https://docs.solace.com/Features/Dynamic-Msg-Routing.htm>`_.

The following PubSub+ Cloud plans are DMR enabled:

- Kilo
- Mega
- Giga
- Tera

A DMR cluster is automatically configured on the PubSub+ Broker and enabled within the message VPN. The password
for cluster communication is stored in PubSub+ Cloud and available from the **Status** tab on the service details page, along with all other relevant DMR cluster
information.

Note that in PubSub+ Cloud, you should only use external links to create event meshes. Internal links will be managed for you by PubSub+ Cloud. To create DMR cluster links, use the 
`click-to-connect feature <https://docs.solace.com/Configuring-and-Managing/DMR-Examples.htm>`_ in the PubSub+ Manager.
