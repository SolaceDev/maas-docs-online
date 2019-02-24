How to Manage API Tokens
========================

You need an API token to authenticate and authorize REST requests made to PubSub+ Cloud's REST API. 
When creating an API token, you will configure what permissions it has (i.e., a subset of the permissions you have when you log in to PubSub+ Cloud).

Create an API Token
~~~~~~~~~~~~~~~~~~~

The following steps will illustrate how to create an API token that has the permissions to retrieve, create and delete messaging services.

1. Login to PubSub+ Cloud.
2. Click on your name in the right side of the menu bar to navigate to Token Management.

.. image:: ../img/use_api_tokens_1.jpg
   :target: https://console.solace.cloud/api-tokens

3. Click the **Create Token** button.

.. image:: ../img/use_api_tokens_2.jpg
   :target: https://console.solace.cloud/api-tokens

4. Give the token a name and enable these permissions:

  * Get My Services
  * Create Services
  * Delete My Services

.. image:: ../img/use_api_tokens_3.jpg
   :target: https://console.solace.cloud/api-tokens/create

5. Click the **Generate Token** button.
6. Copy the token to your clipboard by clicking the **Copy** button. **Note:** You will not see this again for security reasons. If you lose the token, you can always regenerate the token or create a new one.

Now you can use this token to manage messaging services using PubSub+ Cloud APIs.

You will need to use this token in the following REST header to all calls you make:

``Authorization: Bearer <Your New Token>``

Note: A token's permissions cannot be modified once it is created. You can simply create a new token if you need different permissions.


Deleting an API Token
~~~~~~~~~~~~~~~~~~~~~

To Delete a token: 

1. Login to PubSub+ Cloud.
2. Click on your name in the right side of the menu bar to navigate to Token Management.
3. Click **Delete** on the token you want to delete.


