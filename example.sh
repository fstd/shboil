#!/bin/sh

# Try:
# ./example.sh -h
# ./example.sh apple orange
# ./example.sh -v apple orange
# ./example.sh -vv apple orange
# ./example.sh -w apple orange
# ./example.sh -w -t 123 apple orange

optvars="
	'blendtime:t:60@time to blend the ingredients, in seconds'
	'wash:w@wash the ingredients first'
"

argvars="
	'ingr1@first ingredient'
	'ingr2@second ingredient'
"


# De-facto entry point (shboil.inc.sh calls this after initializing)
Main()
{
	if [ -n "$wash" ]; then
		A "Washing $ingr1 and $ingr2"
	fi

	A "Blending $ingr1 and $ingr2 for $blendtime seconds"

	A "This message will always be printed"
	A "BTW, try -h, -v and -vv. Also, we're running version $(Boilver)"
	W "This is a warning and will always be printed"
	D "This is a debug message and will only be printed if -v was given"
	V "This is a verbse debug message and will only be printed if -vv was given"
	E "This is an error message and will alwasy be printed. Also, it implicitly calls exit."

	exit 0
}


# Boilerplate vars
prgauthor='fstd'
prgyear=2015
prgcontact='#fstd'

. shboil.inc.sh
