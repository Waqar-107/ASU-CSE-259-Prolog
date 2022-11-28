# Visual Representation of the lyrics
<img src="./assets/final-project-diagram.png" height="250" width="400"/>

# Some hints for the project

- We need to maximize the number of rules and minimize the number of facts. If you observe carefully, we could just write a ton of facts to make a prolog version of the song. But we will be smart and write rules so that we can reduce the number of facts.

- We need to define the relationships using rules.

- We can use some of these rules,
  - `wife(X, Y)`
  - `married(X, Y)`
  - `parent(X, Y)`
  - `parent_in_law(X, Z)`
  - `step_parent(X, Y)`
  - `biological_parent(X, Y)`
  - `grandparent(X, Z)`
  - `sibling(X, Y)`
  - `sibling_in_law(X, Y)`
  - `uncle_aunt(X, Z)`