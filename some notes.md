# ASU CSE-259-Logic in Computer Science (Recitation)
# Prolog

## Issues and fixes
- If the environment variable of gprolog such as `GLOBALSZ`, `LOCALSZ` is configured incorrectly, the IDE might stop working. It might close immediately whenever opened. Even if uninstalled and installed again, it won't work. The reason behind this is, that these environment variables are saved by the operating system that are not removed while uninstalling. If we remove these, our IDE will start functioning again. To fix this, the following steps need to be done. (this is for WINDOWS)
  - Hit the `Win + R` button and type `regedit`.
  - Open `HKEY_CURRENT_USER\Software\GnuProlog\`
  - Delete `GnuProlog` folder and we are done

- If you need to change variables such as LOCALSZ or GLOBALSZ, you can do it from the GNU Prolog console in Windows. For mac use `LOCALSZ=28400 GLOBALSZ=1500000 TRAILSZ=284000 gprolog` to open GNU Prolog and then load your pl file to increase memory.

- Running the code on Mac
  - Open GNU prolog in the terminal by the command `gprolog`
  - Write `consult('full_path.pl')`. Do not forget the quotes.

## Some concepts
1. Difference between `\=` and `\==`

   `\=` is often used in negation-as-failure scenarios. For example, not(X = Y) succeeds if X and Y cannot be unified.

   `\==` is useful when you want to ensure terms are completely separate entities, not just different values.

  What is Unification in Prolog?
  
  Unification in Prolog is the process of making two terms identical by finding appropriate values for variables. It is Prolog's way of solving equations between terms.

  Unification succeeds if Prolog can make the two terms equal by assigning values to variables. If unification fails, it means no possible values can make the terms identical.
