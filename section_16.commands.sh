####
# on mac or linux
docker container run -it -v $(pwd):/app ruby:2.3 sh
# on windows
MSYS_NO_PATHCONV=1 winpty docker container run -it -v ${pwd}:/app ruby:2.3 sh
####

# inside the container or on a terminal
gem install travis --no-rdoc --no-ri
gem install travis
travis 
travis login # use github credentials


travis encrypt-file service-account.json -r federicoviscomi/multi-k8s


