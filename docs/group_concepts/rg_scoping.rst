Azure Resource Group Scoped Private Datacenter 
========================================

In PubSub+ Cloud, you need to determine which datacenter will be used to locate your new messaging service broker. These datacenters are either public or private located on different cloud, ie AWS, GCZ, or Azure.  Private datacenter cannot be used by any other organizations where pubic datacenter can be shared by many organzations.  
For Public Azure Cloud, any time you create a new message service, Solace will first allocate a new resource group and then deploy all infrastructure required for message broker within the new resoure group. Deletion of resource group happens on when you delete the message service.
If you are a Enterprise customer with application in Azure Cloud, you may only want a private Azure datacenter for your message services which follows your own set of policies and security protocol.  In such a case, you may want to enable resource group scoped private data center.

A private Azure Datacenter that is resource group scoped will  
* deploy a messaging service to only resource group that you give Solace Datacenter access to
* restrict Solace Datacenter's access to only the resource groups that you have scoped Solace Application's role to.
* ensure Solace Datacenter cannot create new resource group modify any non Solace Datacenter resources within the Azure account

To enable this feature, at the time of datacenter setup, the Azure application that will be created for the datacenter will not be given any subscription level role assignment.  You will have the ability to manage the custom role that is associated to this application.  
You will need to give it resource group scoped assignment as new message services are required.  To make things easier, you may batch create a resource group for each message service you require and then give it the proper role assignement. 
To learn how to do this, please refer to 
`How to Add New Azure Resource Group for New Messaging Services in Private Azure Cloud </group_howto/ght_add_resource_group_scoping.html>`_ .
