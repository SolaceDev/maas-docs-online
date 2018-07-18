Microgateway  Quickstart
========================


To get started on this exercise, you need docker (18.03 and up) and docker-compose (1.21 and up)


1. Instal PubSub+ broker
~~~~~~~~~~~~~~~~~~~~~~~~~

Copy and paste this line to your terminaL:

.. code-block:: docker

   wget https://gist.githubusercontent.com/tzoght/281052e24d463eb182b5534ba4dd55e8/raw/f284a08e857f6fba78f5d01ff47bd5daf73237b6/singleNode.yml && docker-compose -f ./singleNode.yml up



You should have Solace PubSub+ Standard Edition running on you machine.


2. Configure PubSub+ broker
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

        <div>
            <iframe height='600' scrolling='no' title='Solace SEMP V2 Client' src='//codepen.io/tzoght/embed/ZjYMWo/?height=265&theme-id=dark&default-tab=result&embed-version=2&editable=true' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/tzoght/pen/ZjYMWo/'>Solace SEMP V2 Client</a> by Tony (<a href='https://codepen.io/tzoght'>@tzoght</a>) on <a href='https://codepen.io'>CodePen</a>.
            </iframe>
        </div>

This snipped will help you configure the message broker.



3. Now let's run an example
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

        <div>
            <iframe height='600' scrolling='no' title='Simple: PubSub+ Request/Reply' src='//codepen.io/tzoght/embed/OEedYX/?height=265&theme-id=dark&default-tab=js,result&embed-version=2&editable=true' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/tzoght/pen/OEedYX/'>Simple: PubSub+ Request/Reply</a> by Tony (<a href='https://codepen.io/tzoght'>@tzoght</a>) on <a href='https://codepen.io'>CodePen</a>.
            </iframe>
        </div>