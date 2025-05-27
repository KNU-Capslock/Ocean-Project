# run.sh
#!/bin/bash

pull_or_clone() {
  REPO_URL=$1
  DIR_NAME=$2

  if [ -d "$DIR_NAME/.git" ]; then
    echo "Updating $DIR_NAME..."
    git -C "$DIR_NAME" pull
  else
    echo "Cloning $DIR_NAME..."
    git clone "$REPO_URL" "$DIR_NAME"
  fi
}

pull_or_clone https://github.com/KNU-Capslock/Ocean-Frontend.git Frontend
pull_or_clone https://github.com/KNU-Capslock/Ocean-Backend.git Backend
pull_or_clone https://github.com/KNU-Capslock/Ocean-AI.git AI