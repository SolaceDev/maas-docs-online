Frequently Answered Questions
=============================

What are service types in Solace PubSub+ cloud?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In PubSub+ Cloud, you are provided with a list of service types to choose from. These service types are configured to support your service depending on your needs, such as number of connection, storage and network bandwidth.

For a Standard PubSub+ cloud account, the following types are available:

* Free
* Starter
* Professional

For an Enterprise PubSub+ cloud account, the following types are available:

* Developer
* Enterprise

How can I get access to Enterprise service types?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you signed up for free on `our website <https://solace.com/cloud/>`_ you will be using a Standard account which only has access to the Free, Starter and Professional service types. In order to use the service types with extended capabilities, such as Enterprise, you must upgrade to an Enterprise account. To do this please `contact us <https://console.solace.cloud/support>`_.

How do I know which service type is best for my needs?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To understand the details of the service types offered by PubSub+ cloud, please visit `the pricing page <https://solace.com/cloud/pricing/>`_ on our site.

Can I change my service type?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can raise a request to change to the service type best suitable for your needs and our production engineering team will help you with it.

I have reached my limit, how can I get a higher service type limit?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please see :doc:`this page <../group_howto/ght_capacity_increase>` on service limits for more information.

How does On Demand billing compare to Prepaid subscriptions?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On Demand billing charges you monthly based on your service and data usage, whereas Prepaid subscriptions charge you a flat fee for a pre-determined number of service hours at a discounted rate.
You could use a mix of both On Demand and Prepaid subscriptions in your account. Most customers will purchase Prepaid subscriptions for applications with predictable usage,
and use on-demand to cover any overages, for new applications or for those applications with variable usage.

:doc:`Learn more about Prepaid subscriptions <../group_concepts/gc_prepaid_subscriptions_concepts>`

What's the advantage to having a subscription?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Prepaid Subscriptions provide you a discount in return for a longer-term commitment and help you minimize your invoicing overhead.

What clouds and regions are available?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This information is available at the bottom of our `pricing page <https://solace.com/cloud/pricing/>`_. We are always adding more clouds and regions based on demand. If you don't see a region that you need, please get in touch with us by using the `support page in our console <https://console.solace.cloud/support>`_.  If you don't yet have access to our console you can `sign up for free <https://cloud.solace.com/signup/>`_.

Why aren't all of the regions listed on the `pricing page <https://solace.com/cloud/pricing/>`_ available when I'm creating a service?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Only certain regions are available when creating a Free service.  Free service regions are marked with an asterisk on our `pricing page <https://solace.com/cloud/pricing/>`_. Even if you're not using a Free service, you may notice that some regions are not available. This is because we list all of the "Available" regions on our website, while only the "Enabled" regions can be used when creating a service.

"Available" regions are those which have been identified as having the IaaS resources that are required to run our messaging services. "Enabled" regions are those in which PubSub+ Cloud infrastructure is installed and ready to create messaging services.

Can I request a region listed on the `pricing page <https://solace.com/cloud/pricing/>`_ to be available when I'm creating a service?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Yes, we add regions to PubSub+ Cloud based on customer demand and you can request a region from our Create Service screen.

* Click the "Request a region" link under the map

.. image:: ../img/RequestARegionLink.png

* Select the regions you want to request, enter any specific notes about your request and click "Send Request"

.. image:: ../img/RequestARegionWindow.png

Our Production Engineering team will contact you shortly.

Can I deploy PubSub+ Cloud messaging services in my own VPC?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Yes, we can setup a private datacenter for your organization that will create PubSub+ Cloud messaging services in your own VPC.
To set this up, you can contact Solace PubSub+ Cloud support and our Production Engineering team will contact you to arrange the installation.

What are the advantages and disadvantages of deploying PubSub+ Cloud messaging services in my own VPC?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The advantages to using your own VPC are:

* All messaging traffic can be private
* Can achieve the best performance and latency for messaging access
* Can receive the lowest IaaS costs for network data usage

The advantages of using the PubSub+ Cloud regions are:

* Simpler to start up a service
* No local setup or installation required
* No management of your own cloud resource thresholds required

What are the benefits of using PubSub+ Cloud over running the PubSub+ Broker myself?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PubSub+ Cloud messaging services are fully managed by Solace and come with many advantages, including:

* Start up a messaging service anywhere in the world immediately with the press of a button
* Carefully engineered PubSub+ Broker deployment for the different clouds to achieve optimal speed and resiliency
* Fully managed, lossless upgrades
* 24x7 support