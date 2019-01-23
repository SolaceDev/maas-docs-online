How to Pick the Right Service Plans for Your Needs
================================================

The single most important factor to consider when picking a service plan is the maximum number of connections your applications may need. This is the upper limit on the number of clients that can connect to your messaging service at the same time. It also indicates how many queues and topic-endpoints you can associate with your messaging service.

Calculating the maximum number of connections you need should be based on assuming your messaging service will operate in isolation, without bridging, which means that applications can only exchange messages if they all connect to the same messaging service. If applications do not need to exchange messages, they shouldn't be put onto the same messaging service, so the number of those connections shall be counted separately.

Although service plans with higher connections counts have higher throughput, this is generally not factor you should consider when picking a service plan. For example, there is no linear correlation between the maximum throughput and the maximum single connection throughput.

Another factor to consider is the maximum amount of storage you will need if you adopt guaranteed messaging. Typically, the messaging service should not be used as storage solution, but it may be approprirate for temporary storage scenarios, such as delayed processing. To determine the maximum storage you need, estimate the worst-case number of messages that might need to be stored, multiplied by the average message payload size. Additionally, you may want to use the 80% threshold rule to leave some headroom.

