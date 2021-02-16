# BootImage
Instructions on how to build a boot image using Kiwi and SLES

This document is meant to walk you through the process of using Kiwi to build a local machine image using a local RMT server.

This is based upon using the JeOS samples provided under the kiwi-templates-jeos package.


What Kiwi-Server-Config script does :-
# Connecting Repos

There are a number of Repos that need to be added to allow all the packages to be pulled that are needed. 

The first part of the Kiwi-Server-Config.sh connects these repos and does a zypper refresh to update the local cache.

# Install kiwi and templates

The second part of this script installs the kiwi templates for jeos which we use as the basis for the rest of the configuration. This install also brings in kiwi and its related code that is needed to perform the builds.

# Extra connected Repos

The last part of this script will take the list of repos and reformat them into a format that can be added into a the JeOS template file to get kiwi to build from a local repo server.

