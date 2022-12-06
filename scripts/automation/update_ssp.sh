#!/bin/bash

export COMMIT_TITLE="chore: Profiles automatic update."
export COMMIT_BODY="Sync profiles with OCP-oscal-profiles repo"
git clone https://$GITHUB_TOKEN@github.com/ComplianceAsCode/ocp-oscal-ssp
cd ocp-oscal-ssp
git checkout -b "profile_autoupdate_$TRAVIS_BUILD_NUMBER"
cp -r ../profiles .
cp -r ../catalogs .
if [ -z "$(git status --porcelain)" ]; then 
  echo "Nothing to commit" 
else 
  git diff
  git add catalogs 
  git add profiles
  git commit -m "$COMMIT_TITLE"
  git push -u origin "profile_autoupdate_$TRAVIS_BUILD_NUMBER"
  echo $COMMIT_BODY
  curl -u Ekaterina-Nikonova:$GITHUB_TOKEN -X POST -H "Accept: application/vnd.github.v3+json"  https://api.github.com/repos/ComplianceAsCode/ocp-oscal-ssp/pulls -d '{"head":"'"profile_autoupdate_$TRAVIS_BUILD_NUMBER"'","base":"develop","body":"'"$COMMIT_BODY"'","title":"'"$COMMIT_TITLE"'"}'

fi

