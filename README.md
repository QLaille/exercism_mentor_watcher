# exercism_mentor_watcher
A script used to check your clipboard for an exercism command and executes it in a docker, in a separate terminal. This works only for the C track for now.

## Usage

`./exercism_mentor_watcher.sh $EXERCISM_MENTOR_TOKEN` where $EXERCISM_MENTOR_TOKEN is your mentor token available [in your settings](https://exercism.io/my/settings).

This script relies on [my dockerfile for exercism](https://github.com/QLaille/exercism_docker_c) located in a folder named "dockerfiles" in your exercism folder.

It will keep looking at your clipboard until you copy an exercism command located on the page of an exercise under the "Download that solution" category, open a new terminal and run in a docker the student's solution. It also uses [exercism_mentor_ignore](https://github.com/QLaille/exercism_mentor_ignore) to manage ignored tests.
