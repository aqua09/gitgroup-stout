FAQ-CW
======

I will be using this for any questions I may have.

Not so much a question as an interesting discovery that makes total sense.

  (master) from the 'master' branch I switched to my 'clay' branch.
  (clay) I added a new file.. git add 
  (clay) then I created a branch named 'dev', git branch dev
  (clay) then I switched to the new branch, git checkout dev
  (dev) the 'dev' branch looks just like my 'clay' branch looked when I created 'dev'

  lesson: git branch newbranch will be based on the current branch.

  So I deleted the 'dev' branch, git branch -d dev
  then, git checkout master.. which wanted me to commit my changes or stash them, git commit.
  then I created dev, git branch dev.


Questions
---------

Q. If I create a branch on my desktop and never merge it into master then how can I get that
  branch down to my laptop?

A. git fetch branch-name
  then change to branch-name, git checkout branch-name


Q. How do you go back to a previous commit?

A. git revert --hard [sha_of_commit]


Q. How do you undo a merge?

A. git revert -m 1 [sha_of_merge]


Q. How do you view all tags?

A. git tag


Q. How do you view all branches?

A. git branch

 
