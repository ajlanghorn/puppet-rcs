# puppet-rcs

A Puppet module for configuring `/etc/default/rcS`, a script to control the
behaviour of boot-time scripts.

## Usage

### Installation

If you're using a Puppet package managment system such as
[r10k](https://github.com/puppetlabs/r10k) or
[librarian-puppet](https://github.com/rodjek/librarian-puppet), you can
include this module in your Puppetfile as such:

`mod ajlanghorn/puppet-rcs`

If you're running Puppet Enterprise, you can install this module using:

`puppet module install ajlanghorn-puppet-rcs`

### Configuration

A number of options are available to be configured using this module,
including:

  - `TMPTIME`
  - `SULOGIN`
  - `DELAYLOGIN`
  - `UTC`
  - `VERBOSE`
  - `FSCKFIX`

Brief descriptions can be found in `init.pp`, or via your distro's help
system.

To configure an option, you can either include this class inside a manifest
and provide an option, or include it and provide options in Hiera. The
latter is a more extensible way of using this module, so is recommended.

#### Hiera

In your manifest, include the module:

`include rcs`

And then configure options in your Hiera backend, namespaced around `rcs`.
For instance, to configure `VERBOSE` to `yes`, set:

`rcs::verbose: 'yes'`

Where an option takes a numerical value, the value can be passed without
quoting it to transform it to a string. For instance, to set `TMPTIME` to
`7`, use:

`rcs::tmptime: 7`

### Class inclusion

In your manifest, include the module as such:

```
class { 'rcs' :
 verbose => 'yes', 
}
```

## Contributions

Contributions are both appreciated and encouraged. To get started:

  1. Fork the module, then clone it (`git clone git@github.com:username/puppet-rcs.git`)
  1. Create a feature branch (`git checkout -b feature-branch-name`)
  1. Commit your changes to your branch (`git commit -vm 'Add new feature'`)
  1. Push to your feature branch (`git push -u origin HEAD`)
  1. Create a new pull request

When adding a new feature, it would be very much appreciated if tests were
bundled in to the same pull request. If you need help writing tests, please
feel free to mention me in your pull request or raise an issue and we can
look together.
