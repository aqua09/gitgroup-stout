gitgroup-stout
==============

The is a demonstration repo to be used as part of a Git study group.

In order to push changes to this repo, either..

1) I will need to add you as a contributor

 or

2) You can fork the project and then send pull request.

Both options make for a good exercise.


NOTES
-----

2014.10.01

Inspired by Chris :) I created the following to demonstrate how one can dynamically
update their environment based on the current branch this is checked out.

My example was developed on Linux but should run fine in a Terminal session on Mac OS.

I created a bash script called .config-set that basically copies the appropriate .config-*
file to .config based on our current branch.

If we checkout the 'ruby' branch our .config file will be overwritten with .config-ruby.

If we checkout the 'dev' branch our .config file will be overwritten with .config-dev.

If we checkout any other branch our .config file will be overwritten with .config-default.

Our .gitignore file contains the following line:

.config*

To try this out do the following..

copy config-* to .config-*

Your working directory should now include..

	.config-dev
	.config-ruby
	.config-default
	.config-set

	copy post-checkout to .git/hooks/
	chmod 775 .git/hooks/post-checkout

Give it a shot..

	git pull origin ruby:ruby
	git checkout ruby
	git checkout master

So.. now we have a dynamically generated .config file based on the branch we checkout.. sweet!


2014.09.26

All branches have been merged into master.

2014.09.19

I created a new branch, 'breakme'. This should be interesting!
Even though there is now a 'breakme' branch.. feel free to experiment on any branch :)

GUI's can be nice and may integrate well into your workflow. However, I __highly recommend__
having a Git Bash shell (Windows) or a Terminal shell (Mac) open to use along with the
examples throughout the book.



Reading Assignments
-------------------

__Oct 01:__

Webcast: Git for Grown-ups

1pm-2pm

help make sense of branching, merging, conflicts, etc..

__Sept 25:__
 
- Please read: Finish Chapter 2, 3.1, and 3.2
 
- Try some commands on github

__Sept 18:__
 
- Please read: Chapter 1, and 2.1, 2.2, and 2.3.

