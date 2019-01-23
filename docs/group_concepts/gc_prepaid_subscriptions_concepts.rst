Prepaid Subscriptions
======================

Prepaid subscriptions are a way to pay upfront for PubSub+ Cloud messaging services at a discounted price.
Subscriptions come with service usage which are used by PubSub+ Cloud messaging services before
falling back to on-demand rates.

Details
~~~~~~~
Subscriptions are purchased for a set term, typically a year at a time (i.e. 12 months).
At the beginning of every month, each active subscription is translated into the number of hours in the month for each given plan (for example, a month with 31 days translates to 744 hours).

Each PubSub+ Cloud messaging service uses hours while it is running, rounded up to the nearest hour.

At the end of each month, the total number of service hours per plan are calculated.
Each active subscription for the month reduces the total hours used of the respective plan and the remainder is charged at on-demand rates.

Unused subscription service usage is not rolled over to the next month.

Example
~~~~~~~
Assume that the following subscriptions were purchased, each with 6 months remaining in their term:

- 2x kilo subscription
- 1x mega subscription

This means for 6 months, the following usage will be included without any extra cost per month:

- 2 * (24 * number of days in month) hours of kilo service usage (ex. 1488 hours for months with 31 days)
- (24 hours * number of days in month) hours of mega service usage (ex. 744 hours for months with 31 days)

Suppose in January, the following services were created:

- 3x kilo services, each running for the entire month
- 2x mega services, each running for half of the month
- 1x giga service, running for 1 hour and 54 minutes

At the end of the month, the usage is as follows:

- 2232 hours of kilo service usage (1 month of hours x 3 kilo services)
- 744 hours of mega service usage (0.5 month of hours x 2 mega services)
- 2 hours of giga service usage (1 hour and 54 minutes rounded up)

After subtracting the included usage from the prepaid subscription, the following will be charged at the on-demand rates:

- 744 hours of kilo service usage (2232 kilo hours used - 1488 kilo hours from subscriptions)
- 0 hours of mega service usage (744 mega hours - 744 mega hours from subscription)
- 2 hours of giga service usage (2 giga hours - 0 giga hours from subscriptions)

Starting July, all service usage will be considered on-demand usage unless subscriptions are renewed.
