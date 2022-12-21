# Bizbox

This project was designed for x64 machines running Ubuntu Server 20.04 or 22.04. 

### Featured Applications

- Wordpress
- InvoiceNinja
- MariaDB
- Redis Object Cache
- Traefik
- Authelia

### Install dependencies

Install Bb command line and Bizbox repository

```
git clone https://github.com/GrecoTechnology/bb
cd bb/
chmod u+x bb_install.sh
bash -H bb_install.sh
```

### Bizbox preinstall

Create a cloudflare account and API token.
- Go to https://dash.cloudflare.com/profile/api-tokens
- Click "Create Token"
- Click "Use template" to the right of "Read all resources"
- Configure or keep as default and click "Continue to summary" 
- Review and click "Create Token"
- Copy your token for the next step

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


