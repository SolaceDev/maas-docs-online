Try Your Service
=============================

To start integrating your applications with Solace PubSub+ Cloud, you must first `create a messaging service <ggs_signup.html>`__. This getting started tutorial will walk you through trying your new service. You will try out the service by connecting a publisher and a subscriber, subscribing to a topic, and publishing a matching message.
Beyond trying your service out, you can also learn more about the web messaging APIs by viewing the source code on Code Pen.

Goals
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The goal of this tutorial is to demonstrate the most basic messaging interaction using Solace. This tutorial will show you:

1. How to connect a publisher and a subscriber.
2. How to subscribing to a topic.
3. How to publish a matching message.

Step 1: Go to try me tab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To access the try me tab, follow the steps below.

1. Go to your services page by selecting services from the top navigation bar.
2. Select your service to navigate to the service details page.
3. On the service details page, navigate to the **Try Me!** tab.

.. image:: ../img/tryMe_1.png

.. image:: ../img/tryMe_2.png
    :width: 600px

Step 2: Connect publisher and subscriber
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The try me tab is divided into the following sections.

* Donut charts at the top representing your service metrics such as network usage, guaranteed messaging endpoints and the number of active connections.
* Two code pen projects: publisher and subscriber. Clicking connect will use the default settings, if you are interested in customizing those settings, you can select 'show advanced settings' option.

To connect publisher and subscriber, follow the steps below.

1. Click on the connect button in step 1 for the publisher.

.. image:: ../img/tryMe_3.png
    :width: 400px

2. Click on the connect button in step 1 for the subscriber.

.. image:: ../img/tryMe_4.png
    :width: 400px

3. Validate publisher and subscriber connection.

.. image:: ../img/tryMe_5.png
    :width: 700px

Step 3: Subscriber to a topic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Subscribe to the **try-me** topic under step 2 on the subscriber window. `Click here <https://docs.solace.com/Features/Topic-Support-and-Syntax.htm>`_  to learn more about topics.

.. image:: ../img/tryMe_6.png
    :width: 400px

Step 4: Publish a matching message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Publish a message with **try-me** as the topic name under step 2 on the publisher window.

.. image:: ../img/tryMe_7.png
    :width: 400px


You should see that the message has been sent on you publisher and received by your subscriber.

.. image:: ../img/tryMe_8.png
    :width: 600px

Step 6: Learn more
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Learn more about `topic hierarchy <https://docs.solace.com/Features/Topic-Support-and-Syntax.htm>`_.
* Learn more about `management APIs <../group_quick_starts/gqs_using_management_apis.html>`__.
* Learn more about `Solace Messaging APIs <../group_quick_starts/gqs_using_messaging_apis.html>`__.
* Learn more about `open Messaging  APIs <../group_quick_starts/gqs_using_open_apis.html>`__.
