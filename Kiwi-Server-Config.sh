# Kiwi Server Config Script

SUSEConnect -p sle-module-desktop-applications/15.2/x86_64

SUSEConnect -p sle-module-server-applications/15.2/x86_64

SUSEConnect -p sle-module-development-tools/15.2/x86_64

zypper refresh

zypper in kiwi-templates-jeos

# List out all connected Repos

for list in $(zypper lr -E | grep SLE[-S] | tr -d ' ' | cut -d'|' -f1); do URL=$(zypper lr -r ${list} | grep ^URI | tr -d ' ' | sed -e 's/URI\://'); echo "    <repository type=\"rpm-md\" >"; echo "    <source path='${URL}'/>"; echo "    </repository>"; done

