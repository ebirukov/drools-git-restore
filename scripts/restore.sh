#!/bin/bash
mkdir -p  ~/.ssh/
cp $KEY_PATH ~/.ssh/id_rsa
chmod -R 0400 ~/.ssh/
ssh-keyscan -p 722 $GIT_HOST >> ~/.ssh/known_hosts
array=($GIT_REPOS)
mkdir -p ${GIT_BASE_PATH}/.niogit/
cd ${GIT_BASE_PATH}/.niogit/
for repo_name in "${array[@]}";
do
git clone ssh://git@${GIT_HOST}:722/drools/${repo_name}.git ${repo_name}.git
done
