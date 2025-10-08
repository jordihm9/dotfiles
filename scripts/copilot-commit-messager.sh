#!/bin/bash
set -e

function copilot_message() {
  local commit_message

  prompt="Write commit message for the change with commitizen convention.
  Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block."

  # Use Copilot to generate a commit message
  commit_message=$(gh copilot complete --prompt "$prompt")

  # Check if Copilot returned a message
  if [[ -z "$commit_message" ]]; then
    echo "Copilot did not return a commit message. Please provide one manually."
    exit 1
  fi

  echo "$commit_message"
}
