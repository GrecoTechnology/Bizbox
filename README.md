# Bizbox

This project was designed for x64 machines running Ubuntu Server 20.04 or 22.04. 

### Featured Applications

- Wordpress
- PhpMyAdmin
- Invoiceninjav5
- MariaDB
- Redis Object Cache
- Traefik
- Authelia
- Portainer

### Install dependencies

Login as root and then install bb command line and Bizbox repository

```
sudo -i
git clone https://github.com/GrecoTechnology/bb; cd bb/; chmod u+x bb_install.sh; bash -H bb_install.sh
```

### Bizbox preinstall

Create a cloudflare account and API token.
- Go to https://dash.cloudflare.com/profile/api-tokens
- Get your Global API Key for the next step

Configure your domain DNS settings to point to Cloudflare

Edit accounts.yml file to specify username, password, email address, and Cloudflare information
```
nano /srv/git/bizbox/accounts.yml
```

This step will create the user account specific in accounts.yml, add it to sudoers, update the kernel, edit GRUB configuration, install Rclone, and reboot if needed.
```
bb install preinstall
```

If your server did not need to reboot you can run su username to switch user or reconnect to SSH as the newly created user. Everything after this point will assume you are running as the user entered in accounts.yml

### Domains and roles

To list all of the available roles, use the following command:
```
bb list
```

All installed domains will include the following roles by default:
- Wordpress
- MariaDB
- phpMyAdmin

The first installed domain will automatically be assigned as your primary domain and will include the following additional roles by default:
- Traefik
- Authelia
- Redis
- Portainer

#### Install new app
To install a domain with roles, you need to specify the domain and then a comma separated list of roles.  See the following example:
```
bb install domain.tld wordpress,invoiceninjav5
```

To switch a domain to primary, you need to specify the domain with a --primary switch
```
bb install domain.tld --primary
```

#### Uninstall an app
To uninstall an app, you need to specify the domain and then a comma separated list of roles.  See the following example:
```
bb uninstall domain.tld wordpress,invoiceninjav5
```
This command will remove the docker apps containers, app files and databases.

To uninstall all apps, you need to use --all tag.  See the following example:
```
bb uninstall domain.tld --all
```

#### Reinstall an app (useful after changing domain.tld.env.yml file)
To reinstall an app, you need to specify the domain and then a comma separated list of roles.  See the following examples:
```
bb reinstall domain.tld wordpress,invoiceninjav5
```
This command will recreate the docker apps containers.

```
bb reinstall domain.tld wordpress,invoiceninjav5 --force
```
This command will recreate the docker apps containers, app files and databases.

To recreate all apps including files and databases, you need to use --all and --force tag.  See the following example:
```
bb reinstall domain.tld --all --force
```

#### Clone an app
To clone an app, you need to specify source domain, destination domain and then a comma separated list of roles.  See the following examples:
```
bb clone src-domain.tld dst-domain.tld wordpress,invoiceninjav5
```
This command will clone the docker apps containers, files and databases of src-domain.tld and use dst-domain.tld to install cloned apps.

To clone all apps, you need to use --all tag.  See the following example:
```
bb clone src-domain.tld dst-domain.tld --all
```