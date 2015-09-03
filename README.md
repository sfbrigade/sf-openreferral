# SF Social Services Open Referral

SF Open Referral is working
with the San Francisco Adult Probation Department (APD)
to collect, maintain, and publish
information about social services in San Francisco.

## Contributing

Before contributing, please read our [wiki]
to understand the needs, background, and context of the project.

Please see the [CONTRIBUTING] document for specifics about
submitting contributions through GitHub.

Once you've done that, contact [project management] or [engineering]
to find out where your contribution will be most helpful.

Thanks for your contributions!

[wiki]: https://github.com/sfbrigade/sf-openreferral/wiki
[project management]: https://github.com/aprilsteed
[engineering]: https://github.com/graysonwright

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

Visit [localhost:3000](http://localhost:3000/) to make sure it's running.

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)


## Env Setup FAQ

### Error: Command 'qmake ' not available

Common fix on macs: `brew install qt`

Otherwise try: [installing capybara-webkit](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)


### Error: No pg_config... trying anyway.

You don't have postgres installed. TODO: find link.


### Ruby env out of date / not installed

[Install ruby on Ubunutu](https://gorails.com/setup/ubuntu/14.04)

### Missing psql

[Install postgresql on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04)

### Error: PG::ConnectionBad: fe_sendauth: no password supplied

Your pgsql is probably not setup. Create a username and password for your pgsql. [pgsql setup](https://help.ubuntu.com/community/PostgreSQL)

Update `/config/database.yml` to have a username and password:

```yml
    username: postgres
    password: postgres
```


