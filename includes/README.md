includes/README.md
==================

Directories require content before they can be added to a repo.

An empty directory is not possible in Git. The directory must contain at least one file.

on branch 'test'..

!!! IMPORTANT !!!

Merge dev into this branch only.

- testing dev merge as follows:
  create a new txt file, dev2test.txt
  git checkout dev
  - make a change to dev then merge it into the 'test' branch.
  vi dev2test.txt
  git commit -a (git add dev2test.txt; git commit)
  git push if other should have this
  git push origin dev

  now merge into test...

  git checkout test
  git merge dev

