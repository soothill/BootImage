# Kiwi Server Config Script

# Connect the various modules that are needed to allow pulling of the appropriate code

SUSEConnect -p sle-module-desktop-applications/15.2/x86_64

SUSEConnect -p sle-module-server-applications/15.2/x86_64

SUSEConnect -p sle-module-development-tools/15.2/x86_64

zypper refresh

# This will install the kiwi templates for Jeos but it also has alot of dependencies so will pull down kiwi-ng at the same time

zypper in kiwi-templates-JeOS



# List out all connected Repos

for list in $(zypper lr -E | grep SLE[-S] | tr -d ' ' | cut -d'|' -f1); do URL=$(zypper lr -r ${list} | grep ^URI | tr -d ' ' | sed -e 's/URI\://'); echo "    <repository type=\"rpm-md\" >"; echo "    <source path='${URL}'/>"; echo "    </repository>"; done > repolist.txt

# Change HTTPS to HTTP

sed -i 's/https/http/g' repolist.txt

# Remove NFS Repos

sed -i '/nfs/,+2d' repolist.txt



# Command to build VMWare Image

kiwi-ng --profile=VMware --type=oem system build --target-dir /tmp/image/VMWare --description .

kiwi-ng --profile=kvm-and-xen --type=oem system build --target-dir /tmp/image/xen --description .