#!/bin/bash
set -e
set -x
#!/bin/bash
set -e
set -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

for i in $SCRIPT_DIR/common/scripts/*;
  do source $i
done

parse_args $@
source_env_from_aws
registry=982306614752.dkr.ecr.us-west-2.amazonaws.com
version=latest

#docker build --target pimcore-web-builder -t pimcore-web . -f Dockerfile
#pimcore_web_image_tag=$registry/pimcore-web:${version}
#docker tag pimcore-web:latest $pimcore_web_image_tag

docker build ./override -t pimcore:latest -f Dockerfile
pimcore_image_tag=$registry/pimcore:${version}
docker tag pimcore:latest $pimcore_image_tag

#docker build --target pimcore-supervisor-builder -t pimcore-supervisor . -f Dockerfile
#pimcore_supervisor_image_tag=$registry/pimcore-supervisor:${version}
#docker tag pimcore-supervisor:latest $pimcore_supervisor_image_tag

docker_login $registry

#docker_push $pimcore_web_image_tag
docker_push $pimcore_image_tag
#docker_push $pimcore_supervisor_image_tag

#if [ "$docker_login" == "true" ];then
#	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 982306614752.dkr.ecr.us-west-2.amazonaws.com
#fi
#if [ "$docker_push" == "true" ];then
#	docker push 982306614752.dkr.ecr.us-west-2.amazonaws.com/keycloak:latest
#fi