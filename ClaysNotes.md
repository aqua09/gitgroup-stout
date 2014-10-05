Clay's Notes
============

The purpose of this file is to demonstrate various tasks, scenarios that may or may not
create issues, e.g., simple fast-forward merges, merge conflicts, etc.

These examples use the command-line and start on the master branch, i.e., git checkout master.

The following aliases are in place (~/.gitconfig)


	[alias]
		co = "checkout"
		br = "branch"
		lol = "log --oneline --graph --decorate"


Scenario: push while local branch 'dev' is behind remote branch 'dev'
---------------------------------------------------------------------

In this scenario the remote 'dev' branch has moved forward. We have not performed pull from origin, i.e.,
'git pull origin dev'.

- Switch my working directory context to the 'dev' branch.

	git co dev

- Creating a new file. I'm doing this so that I know for a fact that one else will be touching the same
  file that I am touching.

  vi cnotes.rb
  
- I'm now ready to add my new file which will stage it and then I'll commit my change.

	git add cnote.rb
	
	git commit

	My default editor, vi, starts and I add my commit message. I also see the changes to be commited listed.

		adding new file
		# Please enter the commit message for your changes. Lines starting
		# with '#' will be ignored, and an empty message aborts the commit.
		# On branch dev
		# Your branch is up-to-date with 'origin/dev'.
		#
		# Changes to be committed:
		#   new file:   cnotes.rb

	Output of the commit:

		[dev 409c9c7] adding new file.
 		1 file changed, 4 insertions(+)
 		create mode 100755 cnotes.rb

 	dev 409c9c7 - the branch and the commit partial checksum.
 	It's interesting to note that in the commit message the following is displayed:
 	
 		# On branch dev
			# Your branch is up-to-date with 'origin/dev'.

	This is not true. I'm not sure exactly why this is displayed. Maybe it's a bug!
	The following should prove the message is false.

- I'm ready to push my changes to the remote 'dev' branch, i.e., origin dev.

	git push origin dev

	Result:

		To git@github.com:clayball/gitgroup-stout.git
 		! [rejected]        dev -> dev (fetch first)
		error: failed to push some refs to 'git@github.com:clayball/gitgroup-stout.git'
		hint: Updates were rejected because the remote contains work that you do
		hint: not have locally. This is usually caused by another repository pushing
		hint: to the same ref. You may want to first integrate the remote changes
		hint: (e.g., 'git pull ...') before pushing again.
		hint: See the 'Note about fast-forwards' in 'git push --help' for details.

	Git has just displayed a message explaining exactly what has happened and what I can
	do to correct it. Lets see what happens..

- Get the new changes that exist on origin/dev branch and not in my local/dev branch.

	git pull origin dev

	My default editor starts. I enter a message and save/exit.

		Merge branch 'dev' of github.com:clayball/gitgroup-stout into dev

		# Please enter a commit message to explain why this merge is necessary,
		# especially if it merges an updated upstream into a topic branch.

	Result:

		remote: Counting objects: 25, done.
		remote: Compressing objects: 100% (24/24), done.
		remote: Total 25 (delta 7), reused 0 (delta 0)
		Unpacking objects: 100% (25/25), done.
		From github.com:clayball/gitgroup-stout
		 * branch            dev        -> FETCH_HEAD
		   6233581..68bb719  dev        -> origin/dev
		Merge made by the 'recursive' strategy.
		 README.md    | 4 ++++
		 dev2test.txt | 1 +
		 2 files changed, 5 insertions(+)

	No need to stash my changes or fix any merge conflicts.

- Now I'm ready to push my changes to origin/dev. Before I do I want to double check my
	working directory.

	git status

		On branch dev
		Your branch is ahead of 'origin/dev' by 2 commits.
      (use "git push" to publish your local commits)

  This looks good. My branch is correctly noted as being 2 commits ahead of origin/dev.
  The first being my commit of cnotes.rb, the second being my pulled merge of origin/dev.

- Now I'm really ready to push my changes to origin/dev.

	git push origin dev
	
	Result:

		Counting objects: 11, done.
		Delta compression using up to 2 threads.
		Compressing objects: 100% (4/4), done.
		Writing objects: 100% (5/5), 603 bytes | 0 bytes/s, done.
		Total 5 (delta 2), reused 0 (delta 0)
		To git@github.com:clayball/gitgroup-stout.git
   	   68bb719..8c2f8b1  dev -> dev

  Excellent!

- Summary

	I started working in my local 'dev' branch by adding a new file.

		git co dev
		
		vi cnotes.rb

	I added the new file and commited (this is all locally).

		git add cnote.rb
		
		git commit

	I tried to push my changes to the remote 'dev' branch, 'origin/dev'.

		git push origin dev

	Git told me that my local branch is behind origin/dev and that I probably want to pull
	the changes that are present on origin/dev. Which is true so I do..

		git pull origin dev

	So far so good. I successfully merged the 'origin/dev' branch into my local 'dev' branch.

	I double checked my working directory and pushed to 'origin/dev'

		git status
		
		git push origin dev


TODO Scenario: create an example of when a stash might be required
------------------------------------------------------------------

TODO: When is it necessary to stash.



Scenario: cherry pick a commit from one branch and merge it with another
------------------------------------------------------------------------

In this example my last commit to my local 'dev' branch was adding ClayNotes.md that contains the
first scenario, "push while local branch 'dev' is behind remote branch 'dev'". I want to bring
this single commit over the the 'master' branch. git cherry-pick requires a clean directory so
I pull from origin/master then do the cherry-pick.

	git co master
	git pull origin master
	git cherry-pick dev

Push my change to origin/master

	git push origin master

This is a very simple example of git cherry-pick


Scenario: Go back to an earlier commit and create a new branch from it
----------------------------------------------------------------------

In this example I want to go back to one of the first few commits and create a "project" branch.

	git log --oneline --graph --decorate  # I've made an alias for this command, lol, i.e., git lol

	Result:

		* | | 5cfd67b Update links.md
			|/ /  
		* | c437806 adding a directory.. can not be empty.. requires at least one file.
		* | 0a01455 add an eclipse project file
		* | 8f1dddf Update links.md
		* | 8c73ca3 adding link to gitref.org.
		* | 4242fec minor updates to make more markdown friendly.
		* | 88db6ef git mv links.txt links.md did a rename.
		* | be0884b adding new file that contains links to useful info.
		|/  
		* c89a946 initial remote commit.. first push.
		* 1433a46 Initial commit

	I decide that the second commit, c89a946, is a good place for me to start.

		git co c89a946

	Great.. I'm back where I want to be. Now to create a new branch for a new project.

		git co -b project-network

	Now I'm good to go in a new project branch. I make additions and am ready to commit and push to
	the remote repo, origin. I need to let the remote know about the new branch before I can push.

	Add and commit locally

		git add network/

		git commit -a

	If I try to push now Git displays a useful message..

		git push origin

		Result:

			fatal: The current branch project-network has no upstream branch.
			To push the current branch and set the remote as upstream, use

    	git push --set-upstream origin project-network

  Ok, I really do need to inform origin of the new branch

   	git push --set-upstream origin project-network

    Result:

    	Counting objects: 10, done.
			Delta compression using up to 8 threads.
			Compressing objects: 100% (3/3), done.
			Writing objects: 100% (4/4), 438 bytes | 0 bytes/s, done.
			Total 4 (delta 0), reused 0 (delta 0)
			To git@github.com:clayball/gitgroup-stout.git
			 * [new branch]      project-network -> project-network
			Branch project-network set up to track remote branch project-network from origin.

	Done.

