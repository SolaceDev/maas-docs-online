How to Add New Azure Resource Group for New Messaging Services in Private Azure Cloud
====================================================

Background
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
If you are an enterprise customer, you may have Solace PubSub+ Cloud configured to use a private access Solace datacenter within your own Azure subscription. To ensure that Solace datacenter’s access to resources within your subscription is restricted, Solace App can be resource group scoped. For any new broker you wish to create via Solace Console, you need to explicitly  create the corresponding broker resource group and role assignment.

Steps Required
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In order to accomplish this, you will need to configure both your Azure Cloud account and Solace PubSub+ Cloud account.
  1. :ref:`Setup the resource group in Azure account and <azuresetup>`
    * :ref:`Create the resource groups needed for new messaging services.<azuresetup>`
    * :ref:`Configure them so Solace App can access them.<azuresetup>`
  2. :ref:`Register the newly added resource group with Solace PubSub+ Cloud.<solacesetup>`

    * Register the resource groups in PubSub+ Cloud so services will now use them. 
    * Query for a list of resource groups that are used by services
    * Query for a list of available resource groups registered with PubSub+ Cloud 

Assumptions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The tutorial assumes you  

* have azure cli knowledge and owner permission to create resource groups and role assignment
* familiar with REST and ability to send REST requests using your favorite tool. It's okay if you don’t. `Check out this REST intro <https://www.restapitutorial.com/lessons/whatisrest.html>`_ and then come back.

What you'll need:

* Azure cloud shell access
  * `Access Cloud Shell at https://shell.azure.com/ <https://shell.azure.com/>`_. 
  * Alternatively use az cli with version >= 2.0.76.  `Access az cli installation details https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-lates <https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest>`_. 
* A Solace PubSub+ Cloud Enterprise Account. As only Enterprise Accounts support multiple users, these REST endpoints cannot be used otherwise. 
* Administrator permissions for your account. 
* You need a way to send REST messages from your dev environment. Postman (6.1.3 or greater) is a good choice if you want a visual REST API Dev Tool
* Click this `link to View the Postman collection <https://documenter.getpostman.com/view/3728825/SW7bzRnP>`_ then hit the “Run in Postman” button.
  * Note that if you prefer to use curl, jQuery, PHP, Python, Ruby or others, you can also view the corresponding examples under the `collection <https://documenter.getpostman.com/view/3728825/SW7bzRnP>` by selecting the language of your choice in the right hand side pane.

.. _azuresetup:

Azure Setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
#. Go to  `https://shell.azure.com <https://shell.azure.com/>`_.
#. Log in with owner access(or any user with the role that allows the creation of resource group and role assignment) to azure account through cloud shell.
#. Upload the bash script below as role-update-custom.sh 
#. run the bash script with following snippet.  Note modify this script according to your need.

.. code-block:: bash
  
  bash role-update-custom.sh --subscription <sub> --role "<appName>_roleBroker" -rg <resourcegroup> -u <appId>
  
-resourcegroup         the name of the azure resource group for a messaging service that the customer plan to create a resource group for
-appName    the name of the azure Solace app setup for Solace Cloud Access
-appId   the clientId or the application Id for the azure Solace app

role-update-custom.sh 

.. code-block:: bash

      #!/bin/bash
      set -e
      usage() {
        echo "Usage: ${0} --subscription<subscription -U <app-name> --role <role-name> -rg resourcegroup " && exit
      }
      location=eastus2
      while [ "$1" != "" ]; do
          case $1 in
              -s | --subscription)
                  shift
                  subscription=$1
                  ;;
              -rg | --resourcegroup)
                  shift
                  resourcegroup=$1
                  ;;
              -r | --role)
                  shift
                  role=$1
                  ;;
              -u | --servicep)
                  shift
                  servicep=$1
                      ;;

              -l | --location)
                  shift
                  location=$1
                      ;;
          esac
          shift
      done

      if [ -z "${subscription}" ]; then
        echo "error: Parameter 'subscription' required" && usage
      fi

      if [ -z "${servicep}" ]; then
        echo "error: Parameter 'servicep' required" && usage
      fi

      if [ -z "${resourcegroup}" ]; then
        echo "error: Parameter 'resourcegroup' required" && usage
      fi
      if [ -z "${role}" ]; then
        echo "error: Parameter 'role' required" && usage
      fi

      roleId=$(az role definition list --custom-role-only  --query "[?roleName=='${role}'].{id:id}" --output tsv)
      roleGenName=$(az role definition list --custom-role-only  --query "[?roleName=='${role}'].{name:name}" --output tsv)
      subscriptionId=$(az account show --subscription ${subscription} --query 'id' -o tsv)
      #scopes=$(az role definition list --custom-role-only  --query "[?roleName=='${role}'].{assignableScopes:assignableScopes[0]}" -o tsv)
      scopelist=($(az role definition list --custom-role-only  --query "[?roleName=='${role}'].assignableScopes[]"))
      scopes="nothing"
      testoutput=$(az role definition list --custom-role-only  --query "[?roleName=='${role}'].assignableScopes[]" |  jq -c '.')

      #//create group first
      az group create --location $location --name ${resourcegroup}
      echo $resourcegroup created


      for i in "${scopelist[@]}"
      do
        if [ $i != '[' ]
        then
          if [ $i != ']' ]; then
              if [ "$scopes" != "nothing" ]; then
                    scopes="${scopes} $i"
              else
                    scopes=${i}
              fi
          fi
        fi
      done

      #echo "scopes after setting ${scopes} "
      scopes="\"/subscriptions/${subscriptionId}/resourceGroups/${resourcegroup}\", ${scopes}"
      echo "update role ${roleGenName}"
      echo "update to scopes  ${scopes}"
      #echo ${testoutput}

      roleDef='{ 
        "id": "'${roleId}'", 
        "name": "'${roleGenName}'", 
          "IsCustom": "true", 
          "Description": "Solace Cloud Role for ", 
          "roleName": "'${role}'", 
          "roleType": "CustomRole", 
          "type": "Microsoft.Authorization/roleDefinitions", 
          "Actions": [ 
              "Microsoft.Authorization/locks/*", 
              "Microsoft.Resources/deployments/*", 
              "Microsoft.Resources/subscriptions/resourceGroups/*", 
              "Microsoft.Compute/images/*", 
              "Microsoft.Compute/*/read", 
              "Microsoft.Compute/snapshots/*", 
              "Microsoft.Compute/disks/*", 
              "Microsoft.Compute/virtualMachines/*", 
              "Microsoft.Compute/availabilitySets/*", 
              "Microsoft.Insights/Metrics/*", 
              "Microsoft.Insights/MetricDefinitions/*", 
              "Microsoft.Network/networkInterfaces/*", 
              "Microsoft.Network/loadBalancers/*", 
              "Microsoft.Network/networkSecurityGroups/*", 
              "Microsoft.Network/locations/usages/read", 
              "Microsoft.Network/virtualNetworks/*", 
              "Microsoft.Network/publicIPAddresses/*", 
              "Microsoft.Storage/storageAccounts/*" 
          ], 
        "NotActions": [], 
        "DataActions": [], 
        "NotDataActions": [], 
        "AssignableScopes": ['${scopes}']
      }'
      az role definition update --role-definition "$roleDef"
      echo "role updated" with new def 

      echo "attempting assigning role --role ${roleGenName} --assignee ${servicep} --resource-group ${resourcegroup}"
      az role assignment create --role ${roleGenName} --assignee ${servicep} --resource-group ${resourcegroup}
      echo "role assigned to the app " $servicep

.. note::
    This script does the following:
      #. create the resourcegroup if doesn't exist
      #. query and update the assigned scope list for Solace custom role(<appname>_roleBroker).  AssignableScopes for the role will be amended to contain the new resource group name.
      #. assign the role to the solace app.

Some times role assignment step may fail as azure's custom role update may take time to propagate.  In this case, please wait a minute and try to re run the command with values outputted from failed script

.. code-block:: bash
  
 az role assignment create --role <Role 's azure name> --assignee <Solace App Id> --resource-group <Resource Group Name>

You may want to setup multiple resource groups at same time.

This will complete Azure side of setup.  The following sections will show you how to register the newly created resource group in Solace Cloud.

.. _solacesetup:

Solace Setup
~~~~~~~~~~~~~~~~~~

In order to create new message service with the newly created resource group, it needs to be registered to Solace Cloud through Solace API. Once a token is generated, you would be able to register and query the resource groups associated to a datacenter.

Create an API Token
~~~~~~~~~~~~~~~~~~~
You need an API token to authenticate and authorize REST requests. When creating an API token, you will configure what permissions it has (i.e., a subset of the permissions you have when you log in to Solace Cloud)

1. Log in to Solace Cloud
2. Click on your name in the right side of the menu bar to navigate to Token Management.

.. image:: ../img/userApi_1.png
   :target: https://console.solace.cloud/api-tokens

3. Click the “Create Token” button

.. image:: ../img/userApi_2.png
   :target: https://console.solace.cloud/api-tokens

4. Give the Token a name and enable these permissions:

  * Get Resource Group
  * Add Resource Group
  * Delete Resource Group (optional, depending on use case)

  Note: If you don't see these permissions listed in the Create Token menu, you may not have adequate (administrator) permissions for your account. Touch base with your account administrator to request access, or contact PubSub+ Cloud support if there is a problem with your permissions.

5. Click the “Generate Token” button
6. Copy the token to your clipboard by clicking the “Copy” button. **Note:** You will not see this again for security reasons. If you lose the token, you can always regenerate the token or create a new one.
7. Set up Postman Collection Authorization – In order for Postman to send REST to Solace Cloud, you need to set the token you just created

  a. Set the Postman Environment to **Solace PubSub+ Cloud** -- look in the drop down in the upper left part of the Postman window.

  .. image:: ../img/userApi_4.png

  b. Edit the Solace PubSub+ Cloud environment and set the token by clicking on eye icon next to the environment drop down. Then click Edit next to **Solace PubSub+ Environment**.

  c. Paste the token in the value field of the **maas_user_token** key and then click Update.

  .. image:: ../img/userApi_5.png

**Great!** Now we have a token, and Postman is set up to use it!

Let’s use it to have some fun.

Register the resource groups with Solace Cloud
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have a token, we can use it call the user REST endpoint to register a resource group.

1. In the Postman Collection “*Resource Group Management For Private Datacenters*”, select the request “**Register Resource Group**”
2. Change the 'resourcegroupname' field to the resource group you wish to register, press enter
2. Change the 'datacenterId' field to the datacenterId you wish to add resource group to, then click on the Send button


You should see a JSON response confirming that the resource group has been registered and is unused

Now go back to the Solace Cloud Account Management page and you should the invited user.


Awesome! You have just registered a resource group.  Now you may want query all the existing resource group to see how they are used.

Get list of all resource group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now let’s see a list of all resource group for a datacenter.  You will need to know your datacenterId for this operation.

In the Postman Collection “*Resource Group Management For Private Datacenters*”, select the request “**Query for a list resource group for a datacenter**”. Press send.

You should be able to see a list of pagnated resource group.  Parameter status can be passed in to query for specific state of resource groups.

-status=available         see all resource groups has not yet been assigned to a service. 
-status=used              see only resource groups that has not been assigned to a service.


Delete a Resource Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now if we have incorrectly added a resource group and it has not been used by a service yet, we may want to clean up. 

In the Postman Collection “*Resource Group Management For Private Datacenters*”, select the request “**Delete a resource group**”. Press send.

You should receive a 200 OK response confirming that the delete request was accepted.


Installing Postman
------------------

If you don’t have Postman installed when you hit “Run in Postman”, it will prompt you to install it (which doesn’t take long). Once Postman is installed, you will need to shut it down and click on the “Run in Postman” link again to import the Postman collection.
If you prefer using CURL, the Postman link above provides the sample CURL commands.


Creating a Message Broker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The moment you've all been waiting for. If you have succesfully completed the azure portion and then succesfully registered the resource group with Solace, you can now create message brokers!  

This is now done as it normally is via the Solace Console or REST calls to the Solace API.

Note: Each broker within that datacenter will use up a resource group that you have created and registered. If you run out of resource groups, more will need to be created and registered.

