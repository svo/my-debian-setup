# My Debian Setup

[![Continuous integration](https://github.com/svo/my-debian-setup/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/svo/my-debian-setup/actions/workflows/main.yml)

## Setup Tested On

| Operating System | Version |
|--|--|
| Debian | 12 |
| Ubuntu | 24.04 |

## Setup Machine

### Bootstrap

Sets up `python`, `pip` and `ansible` before running the `playbook.yml`.

```
./prepare.sh && ./build.sh
```

### Ansible Only

```
./build.sh
```

## Using Vagrant

If no Virtual Machine already in place:

```
vagrant up
```

If Virtual Machine already created:

```
vagrant provision
```

## SSL Certificate

After provisioning you may want to generate the `SSL` certificate for `nginx` using:

```
domain="qual.is"
sudo certbot --nginx -d $domain
```
