Azure Resource Group Scoped Private Datacenter 
========================================

In PubSub+ Cloud, you need to determine which datacenter will be used to manage your new messaging service broker. These datacenters are either public or private and located on different clouds, ie AWS, GCZ, or Azure.  Private datacenters cannot be used by any other organizations whereas pubic datacenter can be shared between many organzations.  
For Public Azure Cloud, any time you create a new message broker, Solace will first allocate a new resource group and then deploy the message broker's infrastrcuture within the resource group. Deletion of resource group occurs on deletion of the message broker.
If you are a Enterprise customer with applications in Azure Cloud, you may want a private Azure datacenter in your own tenat. This allows you to set your own policies and security protocols.  For further security, you may be interested in a resource group scoped private data center.

To understand the benefit of resource group scoped private datacenters it is important to understand some high-level concepts about how a private datacenter operates:

A private datacenter lives inside your tenant. It requires certain permissions to Azure resources so that it can manage message brokers on your behalf. This neccesitates the creation of an application registration with proper roles assigned to give the app access to various Azure resources such as VMs, subnets, etc. The datacenter then uses this application registration to perform deployments neccesary for creation, update, deletion of brokers.

A non resource group scoped datacenter is given roles scoped at a subscription level giving the application the permission to modify all relevant resources within the subscription. 
This may be undesireable if the subscription contains resources unrelated to Solace. This is the problem addressed by resource group scoped datacenters at the cost of decreased ease-of-use.

A private Azure Datacenter that is resource group scoped will  
* deploy a messaging service to only resource group that you give Solace Datacenter access to via custom roles
* restrict Solace Datacenter's access to only the resource groups that you have scoped Solace Application's role to.
* ensure Solace Datacenter cannot create new resource group modify any non Solace Datacenter resources within the Azure tenant or subscription

To enable this feature, at the time of datacenter setup, the Azure application that will be created for the datacenter will not be given any subscription level role assignment.  You will have the ability to manage the custom role that is associated to this application.  
You will need to update the role to reflect the new resource groups created for each message broker.  To make things easier, you may batch together the creation of multiple resource groups.
For detailed instructions, please refer to 
`How to Add New Azure Resource Group for New Messaging Services in Private Azure Cloud </group_howto/ght_add_resource_group_scoping.html>`_ .