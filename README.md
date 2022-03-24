# My Debian Setup

[![Continuous integration](https://github.com/svo/my-debian-setup/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/svo/my-debian-setup/actions/workflows/main.yml)

## Testing

If no Virtual Machine already in place:

```
vagrant up
```

If Virtual Machine already created:

```
vagrant provision
```

## Building

### Including Bootstrapping

```
./prepare.sh && ./build.sh
```

Above sets up `python`, `pip` and `ansible` before running the `playbook.yml`.

### Ansible Only

```
./build.sh
```
