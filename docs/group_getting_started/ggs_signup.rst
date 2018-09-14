Creating Your First Service
=============================

To start integrating your applications with Solace PubSub+ Cloud, you must first create a messaging service. Once your service is created, you can connect your applications with it
by using a client library compatible with the Solace PubSub+ message broker. This getting started tutorial will walk you through creating an account on Solace PubSub+ Cloud,
creating your first messaging service, and obtaining the connection information necessary to get your applications connected to Solace PubSub+ Cloud.

If you are new to **Messaging**, you may wish to first read :doc:`../group_concepts/gc_messaging_concepts`. 

Otherwise, let's get started. You can skip to step 2 if you already have an account. This should not take more than **2 minutes** and will only require a web browser.


Step 1: Sign up for Solace PubSub+ Cloud
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To sign up for Solace PubSub+ Cloud, `click here <https://cloud.solace.com/signup/>`_ to create a **free** account. Click on the following video to view an example of
signing up.

.. raw:: html

	<video width="768" height="480" muted poster="../_static/img/signup.jpg" onclick="this.paused ? this.play() : this.pause();" style="cursor: pointer;">
		<source src="../_static/video/signup.webm">
	</video>

Once you have submitted your details, you will receive a confirmation email. By clicking the Activate button in the email, you will be brought to the Solace PubsSub+ Cloud Console
where you must enter a password to activate your Solace PubSub+ Cloud account. Once activated, you will be automatically logged into the console.

Step 2: Create a service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you have logged into the console, you will be brought to the My Services page. This page will show you all of the various services you have created in Solace PubSub+ Cloud. To
create your first service, press the Create Service button.

This brings you to the Create Service page. Here you must select a plan type, enter a service name, and choose the cloud provider and region where you would like to create your
service.

Solace PubSub+ Cloud gives you access to different plan types that will give various levels of messaging performance. By default, a new Solace PubSub+ Cloud account only has access
to the free plan. Later on, you may request access to additional plans by selecting them and pressing the request access button. For our first service, let's select the Free Plan.

Services are identified in the console by their name. Enter a service name of **My First Service**.

Your service will be created in the cloud provider and region of your choice. By pressing on the map, you can choose one of Solace PubSub+ Cloud's available regions. If the 
region you prefer isn't available, you can contact Solace PubSub+ Cloud support and ask for your region to be supported. For your first service, choose the region closest to 
where your application will run. You can then complete the process by pressing the Start Service button.

To see these steps in action, watch the following video.

.. raw:: html

	<video width="768" height="480" muted onclick="this.paused ? this.play() : this.pause();" style="cursor: pointer;">
		<source src="../_static/video/createservice.webm">
	</video>

Step 3: Find your service's connection information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you've pressed the Start Service button, the console will transition to the Service Details page for your service. It may take some time for your service to be created in the
cloud, but once it is, you will see the status of your service. The options you have when viewing your service details are as follows:

- Status: View the overall status and health of your service.
- Connect: Find the connection information for your service by selecting your language or protocol of choice.
- Manage: Find the management options for your service to perform tasks such as configuring queues or managing clients.
- Plan Details: View the details of the plan you created your service with such as the cloud provider, region, and connection limits.
- Try Me!: Try your service out using applications embedded from CodePen examples that allow you to publish and subscribe for messages on your service.

Go to the Connect tab and choose the messaging protocol your application will be using. If you're not sure, you can also change the View By option to Language which allows you
to browse by the language your client application is written in. Select the client library you would like to use and the required connection information can be viewed for that
library. From here, you can explore more about your client library using the links under the learn more section.

If you've made it this far, we thank you for taking the time to create your first Solace PubSub+ Cloud messaging service.

