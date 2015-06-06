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

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
