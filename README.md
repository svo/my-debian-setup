# My Debian Setup

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
./build.sh
```

Above sets up `python`, `pip` and `ansible` before running the `playbook.yml`.

### Ansible Only

```
ansible-playbook -e "ansible_python_interpreter:'/usr/bin/python3'" -i "localhost," -c local -K playbook.yml
```
