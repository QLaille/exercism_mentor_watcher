# exercism_mentor_watcher

A script used to check your clipboard for an exercism command and executes it in a docker, in a separate terminal.

## Usage

`./exercism_mentor_watcher.sh [$EXERCISM_MENTOR_TOKEN]` where $EXERCISM_MENTOR_TOKEN is your mentor token available [in your settings](https://exercism.io/my/settings), if not specified, it expects EXERCISM_MENTOR_TOKEN to be an environment variable.

This script uses [my dockerfile for the C track of exercism](https://github.com/QLaille/exercism_docker_c).

It will keep looking at your clipboard until you copy an exercism command located on the page of an exercise under the "Download that solution" category, open a new terminal and run in a docker the student's solution. It also uses [exercism_mentor_ignore](https://github.com/QLaille/exercism_mentor_ignore) to manage ignored tests.
