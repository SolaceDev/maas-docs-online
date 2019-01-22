How to Pick the Right Service Plans for My Needs
================================================

The single most important thing in picking a service plan is the max number of connections your applications may need. The max number of connections decides how many clients could connect to the messaging service at the same time. It also decides how many queues and topic-endpoints you could have.

Messaging service operates in isolation, without bridging, applications can only exchange messages if they connect to the same messaging service. The max number of connections shall be estimated in this context. If applications do not need to exchange messages, they shouldn't be put onto the same messaging service, therefore the number of connections shall be counted separately.

Although the service plan with higher number of connections has higher throughput, it is in general not a factor you shall take into consideration for picking a service plan. For example, there is no linear correlation between the max  throughput and the max single connection throughput.

Another factor you may want to take into the consideration is the max storage if you use guaranteed messaging. In general the messaging service shall not be used as storage solution, but there are applications may choose to use it as temporary storage for scenarios such as delayed processing. To estimate the max storage need, estimate the worst case max number of messages that need to be stored, and times with the average message payload size. And in general, you may want to use 80% threshold rule to leave some headroom.

