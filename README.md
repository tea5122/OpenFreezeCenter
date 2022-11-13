

# How To Install.
#### Tip: Disable SECURE BOOT because it interferes with the permission of the script to read/write to EC file.

1. ``` git clone https://github.com/tea5122/OpenFreezeCenter.git```
2. ``` cd OpenFreezeCenter ```
3. ``` chmod +x at_startup.sh install_deps.sh root_permissions.sh```
4. ``` ./install_deps.sh ```
5. ``` sudo ./at_startup.sh ```
6. ```conf.txt``` will be created in the same folder, it will contain all your configurations and fan curve values. Deleting that file will reset all your fan curves.

# Models Supported.
- MSI GS66 (10th Gen Intel)
- MSI GE66
- MSI GS65
- MSI GF63
- MSI GP76 (11th Gen Intel)
