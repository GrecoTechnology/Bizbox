# Bizbox

This project was designed for x64 machines running Ubuntu Server 20.04 or 22.04. 

### Featured Applications

- Wordpress
- InvoiceNinja

### Install dependencies
```
curl -sL https://install.saltbox.dev | sudo -H bash && cd /srv/git/saltbox
```

### Bizbox preinstall

Create a cloudflare account, and setup your Domain DNS to point to Cloudflare DNS Servers.

Edit accounts.yml file to specify username, password, email address, and Cloudflare information
```
nano /srv/git/saltbox/accounts.yml
```

This step will create teh user account specific in accounts.yml, add it to sudoers, update the kernel, edit GRUB configuration, install Rclone, and reboot if needed.
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

To install a domain with roles, you need to specify the domain and then a comma separated list of roles.  See the following example:
```
bb install domain.tld wordpress,invoiceninja
```

To switch a domain to primary, you need to specify the domain with a --primary switch
```
bb install domain.tld --primary
```


