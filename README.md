SpreeFlexibleWeightRate
=======================

This gem is designed in order to add weight based shipping to Spree. It provides a simple flexible weight
calculator using the following system. It's designed for shipping methods which have the
following characteristics:

the first X weight costs Y amount, each additional X weight costs Z amount.


Example
=======

We have a shipping provider which offers the following rates:

The first 100g costs $10, each additional 100g costs $2.

In this case, an item weighting 300g would cost $14 to ship.



Add a new shipping method in spree through the admin interface.

Specify the following options:

* First Package: The cost of up to (and including) the weight specified (10)
* Additional package: The additional cost for every weight increment (2)
* Weight: The amount for each threshold (100)
* Currency: The currency to be billed in.  This must match the order currency.

Note that Spree doesn't provide a unit for weight, and you should choose a unit and
remain consistent in its usage throughout the application.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 FreeRunning Technologies, released under the New BSD License
