# Kiwi Server Config Script

# Connect the various modules that are needed to allow pulling of the appropraite code

SUSEConnect -p sle-module-desktop-applications/15.2/x86_64

SUSEConnect -p sle-module-server-applications/15.2/x86_64

SUSEConnect -p sle-module-development-tools/15.2/x86_64

zypper refresh

# This will install the kiwi templates for Jeos but it also has alot of dependencies so will pull down kiwi-ng at the same time

zypper in kiwi-templates-jeos

# List out all connected Repos

for list in $(zypper lr -E | grep SLE[-S] | tr -d ' ' | cut -d'|' -f1); do URL=$(zypper lr -r ${list} | grep ^URI | tr -d ' ' | sed -e 's/URI\://'); echo "    <repository type=\"rpm-md\" >"; echo "    <source path='${URL}'/>"; echo "    </repository>"; done

