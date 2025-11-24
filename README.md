# My Debian Setup

[![Continuous integration](https://github.com/svo/my-debian-setup/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/svo/my-debian-setup/actions/workflows/main.yml)

An Ansible-based automation framework for configuring a complete Debian/Ubuntu development environment with programming languages, tools, and applications. For more context, see the accompanying blog post at [qual.is/posts/my-debian-setup](https://www.qual.is/posts/my-debian-setup).

## Setup Tested On

| Operating System | Version |
|--|--|
| Debian | 12 |
| Ubuntu | 24.04 |

## Architecture

This project uses Ansible to automate Debian/Ubuntu setup through a role-based architecture:

### Project Structure

```
my-debian-setup/
├── playbook.yml          # Main Ansible playbook
├── roles/                # Role-based configuration modules
│   ├── ssh/              # SSH configuration
│   ├── git/              # Git version control
│   ├── vim/              # Vim text editor
│   ├── python/           # Python and pyenv
│   ├── golang/           # Go language
│   ├── clojure/          # Clojure language
│   ├── nodejs/           # Node.js and npm
│   ├── ruby/             # Ruby and rbenv
│   ├── iac/              # Infrastructure as Code tools
│   ├── nginx/            # Nginx web server
│   ├── claude/           # Claude CLI and AI tools
│   ├── docker/           # Docker container platform
│   ├── system/           # System utilities
│   ├── terminal/         # Shell and terminal utilities
│   ├── security/         # Security tools
│   ├── monitoring/       # Monitoring and observability
│   ├── networking/       # Network utilities
│   ├── development/      # Development tools
│   ├── storage/          # Storage and backup tools
│   ├── todo/             # Task management tools
│   ├── media/            # Media applications
│   ├── desktop/          # Desktop environment
│   ├── internet/         # Web browsers
│   └── office/           # Office applications
├── prepare.sh            # Bootstrap script
├── build.sh              # Ansible execution script
└── Vagrantfile           # Vagrant VM configuration
```

## Setup Machine

### Bootstrap

Sets up `python`, `pip` and `ansible` before running the `playbook.yml`.

```bash
./prepare.sh && ./build.sh
```

### Ansible Only

```bash
./build.sh
```

## Using Vagrant

If no container is already in place:

```bash
vagrant up
```

If container is already created:

```bash
vagrant provision
```

## SSL Certificate

After provisioning you may want to generate the `SSL` certificate for `nginx` using:

```bash
domain="qual.is"
sudo certbot --nginx -d $domain
```

## Contributing

### Conventions

#### Task Naming Convention

All Ansible task names must follow this pattern:
```
- name: <action> <package> <description>
```

Examples:
- `Install jq command-line JSON processor`
- `Configure nginx web server`

**Pattern**: Action verb + package/component + descriptive purpose/type

#### Module Usage

- Use appropriate Ansible modules (prefer `ansible.builtin.apt` over shell commands)

#### Shell Integration

When adding shell integrations:
- Use `ansible.builtin.blockinfile` for configuration
- Add to `~/.bashrc` or `~/.zshrc` for shell-specific settings
- Add to `~/.profile` for environment variables
- Use descriptive markers: `# {mark} ANSIBLE MANAGED BLOCK FOR <TOOL>`
