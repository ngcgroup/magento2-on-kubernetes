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
version=2.4.5

cd src/
docker build ./ -t magento:latest -f Dockerfile
cd -
commerce_image_tag=$registry/magento:${version}
docker tag magento:latest $commerce_image_tag
docker_login $registry
docker_push $commerce_image_tag
