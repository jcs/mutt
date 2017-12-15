#!/bin/sh
#
# Generates the ChangeLog since the last release.

# This would generate based on the last update of the ChangeLog, instead:
# lrev=$(git log -1 --pretty=format:"%H" ChangeLog)

lrev=$(git tag --merged=HEAD --list 'mutt-*-rel' | tr - . | sort -Vr | head -n1 | tr . -)

# This is a rough approximation of the official ChangeLog format
# previously generated by hg.  Git doesn't provide enough formatting
# tools to produce this more accurately.  We could post-format it with
# a script, but I'm not sure enough people care about this file
# anymore to make it worth the effort.
git log --name-status \
    --pretty=format:"%ai  %an  <%ae> (%h)%n%n%w(,8,8)* %s%n%+b" \
    ${lrev}^..
