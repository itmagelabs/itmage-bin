# bin

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with bin](#setup)
    * [Beginning with bin](#beginning-with-bin)
1. [Usage - Configuration options and additional functionality](#usage)

## Description

A Puppet module thay setup general shell libs and scripts for environment

## Setup

### Beginning with bin

To start using the module, you need to add it to the manifest.

```puppet
include bin
```

## Usage

Openstack wrapper used for shorting name of command and some checks

```bash
❯ os server show s1
...
❯ os server delete s1
EXEC: /usr/bin/openstack server delete s1
Do you want to continue?[yn]
```
