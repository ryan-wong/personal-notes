#Stages

Master


Develop


Feature 
- when complete, merge back into develop


Release 
- Accumulated enough features, fork a branch off of develop, start next release cycle, no more features only bug fixes, document generation
- merge into master and develop
- tagged master with version #
- naming convention release-, release/

Hotfix  
- branch off master to fix bug, merge into master and develop
- tag master with new version #


git branch develop
git push -u origin develop

#new feature
git checkout -b appstudio/feature develop

git pull origin develop
git checkout develop
git merge some-feature
git push
git branch -d some-feature


#release branch
git checkout -b release-0.1 develop

#merge release branch
git checkout master
git merge release-0.1
git push
git checkout develop
git merge release-0.1
git push
git branch -d release-0.1

#Tag master
git tag -a 0.1 -m "Initial public release" master
git push --tags

#Maintance Branch
git checkout -b issue-#001 master
# Fix the bug
git checkout master
git merge issue-#001
git push

git checkout develop
git merge issue-#001
git push
git branch -d issue-#001

