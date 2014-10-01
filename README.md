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

First, I created a bash script called .config-set:

	#!/bin/bash
	# set environment based on our branch 
	BRANCH=`git branch | awk '{ print $2 }' | xargs`

	# functions to setup our environment
	set_dev()
	{
		printf %b "[+] on dev branch.. using dev environment\n"
		if [ -f .config-dev ]; then
			source .config-dev
		else
			printf "[-] ERROR - File does not exist: .config-dev\n"
		fi
	}
	# set_ruby function
	set_ruby()
	{
		printf %b "[+] on ruby branch.. using 'ruby' environment\n"
		if [ -f .config-ruby ]; then
			source .config-ruby
		else
		printf "[-] ERROR - File does not exist: .config-ruby\n"
		fi
	}

	# call the appropriate function to set our environment
	case "$BRANCH" in
		'dev' )
		printf %b "[+] calling set_dev()\n"
		set_dev
		;;
		'ruby' )
		printf %b "[+] calling set_ruby()\n"
		set_ruby
		;;
	esac

	printf %b "[+] on branch    : $BRANCH\n"
	printf %b "[+] using DBHOST : $DBHOST\n"



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

