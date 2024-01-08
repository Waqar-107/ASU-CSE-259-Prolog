# ASU CSE-259-Logic in Computer Science (Recitation)
# Prolog

## Issues and fixes
- If the environment variable of gprolog such as `GLOBALSZ`, `LOCALSZ` is configured incorrectly, the IDE might stop working. It might close immediately whenever opened. Even if uninstalled and installed again, it won't work. The reason behind this is, that these environment variables are saved by the operating system that are not removed while uninstalling. If we remove these, our IDE will start functioning again. To fix this, the following steps need to be done. (this is for WINDOWS)
  - Hit the `Win + R` button and type `regedit`.
  - Open `HKEY_CURRENT_USER\Software\GnuProlog\`
  - Delete `GnuProlog` folder and we are done
