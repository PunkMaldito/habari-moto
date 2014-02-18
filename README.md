## Habari Moto

Habari Moto is a link and news aggregation website. It is forked from the Monocle project.

More details can be found [here](http://monocle.io)

### Prerequisites

* Ruby 2.0
* Postgres 9.3
* Redis
* A Twitter app account

### Setup

    bundle install
    createdb habari_moto
    rake db:migrate

### Configuration
Habari Moto needs a few configuration variables to work properly.
You can export them from your terminal like in the following example:

    export TWITTER_KEY=123
    export TWITTER_SECRET=123

Or you can copy the included .sample.env into a .env file and set all your
variables there.

### First time user
To become administrator as first time user, first start Habari Moto with:

    thin start

Login with twitter to Habari Moto, then open a terminal and open Habari Moto inside an IRB session with:

    irb -r ./app.rb

From there execute:

    user = Brisk::Models::User.first
    user.admin = true
    user.registered = true
    user.save

Now you will be able to post, comment and invite users.

Brought to you by your friends at [Sparkplug](http://sparkpl.ug)
