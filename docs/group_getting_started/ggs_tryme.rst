Trying Out Your Messaging Service
=================================

The first thing you need to do with Solace PubSub+ Cloud is to :doc:`create a messaging service <ggs_signup>`. Assuming that you have now created a messaging service, this getting started tutorial will walk you through trying your new messaging service. You will try out the messaging service by connecting a publisher and a subscriber, subscribing to a topic, and publishing a matching message.

Goals
~~~~~
The goal of this tutorial is to demonstrate the most basic messaging interaction using Solace messaging. This tutorial will show you:

* How to connect a publisher and a subscriber.
* How to subscribe to a topic.
* How to publish a matching message.

Step 1: Go to Try Me! tab
~~~~~~~~~~~~~~~~~~~~~~~~~

To access the Try Me! tab, follow the steps below.

1. Go to your messaging services page by selecting Services from the top navigation bar.
2. Select your messaging service to navigate to messaging service details.
3. On the service details page, navigate to the **Try Me!** tab.

.. image:: ../img/tryMe_1.png

4. You will then see the Try Me! tab which has a JavaScript applications that you can use to exchange messages with your PubSub+ messaging service.

.. image:: ../img/tryMe_2.png

Step 2: Connect publisher and subscriber
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Try Me! tab is divided into the following sections.

* Donut charts at the top representing your messaging service metrics such as network usage, guaranteed messaging endpoints and the number of active connections.
* Two `CodePen <https://codepen.io/>`_ projects: publisher and subscriber.

To connect publisher and subscriber, follow the steps below.

1. Click on the connect button under step 1 on the publisher CodePen.

.. raw:: html

    <img src="../_static/img/tryMe_3.png" style="max-width:400px;"/>

2. Click on the connect button under step 1 on the subscriber CodePen.

.. raw:: html

    <img src="../_static/img/tryMe_4.png" style="max-width:400px;"/>

3. Validate publisher and subscriber connection.

.. image:: ../img/tryMe_5.png

4. Optionally: Select the 'show advanced settings' option to see the credentials that this application is using to connect. These credentials are found in the 'Connect' tab and can be used when connecting your other applications.

Step 3: Subscribe to a topic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Subscribe to the **try-me** topic under step 2 on the subscriber window. You can also try other topics if you like. `Click here <https://docs.solace.com/Features/Topic-Support-and-Syntax.htm>`_  to learn more about topics.

.. raw:: html

    <img src="../_static/img/tryMe_6.png" style="max-width:400px;"/>

Step 4: Publish a matching message
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Publish a message with **try-me** as the topic name under step 2 on the publisher CodePen.

.. raw:: html

    <img src="../_static/img/tryMe_7.png" style="max-width:400px;"/>

You should see that the message has been sent on you publisher and received by your CodePen.

.. image:: ../img/tryMe_8.png

Step 6: Learn more
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Well done. You've now exchanged with your messaging service. Want to learn more?

* Try one of the API samples in GitHub:
    * :doc:`Solace Messaging APIs <../group_quick_starts/gqs_using_messaging_apis>`.
    * :doc:`Open Messaging APIs <../group_quick_starts/gqs_using_open_apis>`.
* Learn how to manage your messaging service with our :doc:`REST Management APIs <../group_quick_starts/gqs_using_management_apis>`.
* Learn more about `topic hierarchy <https://docs.solace.com/Features/Topic-Support-and-Syntax.htm>`_.
