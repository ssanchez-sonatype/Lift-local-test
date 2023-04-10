#!/usr/bin/env bash

set -e

function tellApplicable() {
    printf "true\n"
}

function tellVersion() {
    echo "3"
}

function run() {
    {
        date
        echo "Args: $*"
        printf "Stdin: "
        cat <&0
        echo '{ "toolNotes" : [
                   { "type" : "type during run",
                     "message" : "run message",
                     "file" : "a.c",
                     "line" : 3,
                     "noteId" : "noteid"
                   }
               ]}'
    } >> /tmp/x.sh.run.log
}

function finalize() {
    {
        date
        echo "Args: $*"
        printf "Stdin: "
        cat <&0
        echo ""
        local pr_branch
        pr_branch="v3-tool-run-and-finish-$(date '+%F_%0H-%0M-%0S_%N')"
        echo "Checking out ${pr_branch} locally"
        git checkout -b "$pr_branch" &> /dev/null
        echo ""
        cat <<EOF
{
  "toolNotes": [
    {
      "type": "type during run",
      "message": "run message",
      "file": "a.c",
      "line": 3,
      "noteId": "noteid"
    }
  ],
  "pullRequest": {
    "title": "x.sh PR",
    "body": "Bug fixes and performance improvements",
    "target_branch": null,
    "source_commit": null
  }
}
EOF
    } >> /tmp/x.sh.finalize.log
}

function tellName() {
        printf "V3Test"
}

case "$@" in
    run)
        run "$@"
        ;;
    finalize)
        finalize "$@"
        ;;
    applicable)
        tellApplicable
        ;;
    name)
        tellName
        ;;
    *)
        tellVersion
        ;;
esac

