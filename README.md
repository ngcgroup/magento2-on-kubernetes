Magento 2 on kubernetes
=======================

This is a companion repository for our
[Magento 2 on Kubernetes](https://kiwee.eu/magento-2-on-kubernetes/) blog post.

Here you will find all manifests discussed in the article as well as everything
else you need to deploy Magento 2 on Kubernetes yourself.

## Prerequisites

* Minikube or a Kubernetes cluster with NGINX Ingress controller and storage
  provisioning
* `kubectl` configured with the proper context
* Standalone version of [kustomize](https://kustomize.io/) v3.9.0 or newer
* `make`

## Compatibility

This project is developed and tested using [kind](https://kind.sigs.k8s.io/) with the [latest supported patch versions of Kubernetes](https://kubernetes.io/releases/).

## Deployment

Manifests in this repository can be deployed using `make`.

Starting a Minikube cluster with desired capabilities and addons, downloading
external dependencies, and deploying manifests with `kustomize` are all
automated in the `Makefile`.

```
# Start a Minikube cluster
make minikube

# Deploy a minimal Magento 2 configuration
make step-1

# Deploy step-1 with Elasticsearch (using Elastic Cloud on Kubernetes)
make step-2

# Deploy step-2 with Redis for cache and session storage and
# HorizontalPodAutoscalers controlling NGINX and PHP-FPM deployments
make step-3

# Deploy step-3 with Varnish
make step-4
```

apt-get update && apt-get install procps telnet net-tools vim
kubectl ssh -n magento -u root  -c magento-web magento-web-688955487-x6r72 -- bash
kubectl ssh -n magento -u root -c magento-web magento-web-6644867b5b-n28w2 -- sh


Stack trace:
#0 /var/www/html/vendor/colinmollenhour/cache-backend-redis/Cm/Cache/Backend/Redis.php(626): Credis_Client->__call('pipeline', Array)
#1 /var/www/html/vendor/magento/zendframework1/library/Zend/Cache/Core.php(390): Cm_Cache_Backend_Redis->save('{"sales_setup":...', '792_GLOBAL__RES...', Array, NULL)
#2 /var/www/html/vendor/magento/framework/Cache/Core.php(74): Zend_Cache_Core->save('{"sales_setup":...', '792_GLOBAL__RES...', Array, NULL, 8)
#3 /var/www/html/vendor/magento/framework/Cache/Frontend/Adapter/Zend.php(63): Magento\Framework\Cache\Core->save('{"sales_setup":...', 'GLOBAL::RESOURC...', Array, NULL)
#4 /var/www/html/vendor/magento/framework/Cache/Frontend/Decorator/Bare.php(75): Magento\Framework\Cache\Frontend\Adapter\Zend->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#5 /var/www/html/vendor/magento/framework/Cache/Frontend/Decorator/TagScope.php(52): Magento\Framework\Cache\Frontend\Decorator\Bare->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#6 /var/www/html/vendor/magento/framework/Cache/Frontend/Decorator/Bare.php(75): Magento\Framework\Cache\Frontend\Decorator\TagScope->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#7 /var/www/html/vendor/magento/framework/Cache/Frontend/Decorator/Bare.php(75): Magento\Framework\Cache\Frontend\Decorator\Bare->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#8 /var/www/html/vendor/magento/framework/App/Cache/Type/AccessProxy.php(85): Magento\Framework\Cache\Frontend\Decorator\Bare->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#9 /var/www/html/vendor/magento/framework/Cache/Frontend/Decorator/Bare.php(75): Magento\Framework\App\Cache\Type\AccessProxy->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#10 /var/www/html/vendor/magento/framework/Cache/Frontend/Decorator/TagScope.php(52): Magento\Framework\Cache\Frontend\Decorator\Bare->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#11 /var/www/html/generated/code/Magento/Framework/App/Cache/Type/Config/Proxy.php(103): Magento\Framework\Cache\Frontend\Decorator\TagScope->save('{"sales_setup":...', 'global::resourc...', Array, NULL)
#12 /var/www/html/vendor/magento/framework/Config/Data/Scoped.php(123): Magento\Framework\App\Cache\Type\Config\Proxy->save('{"sales_setup":...', 'global::resourc...')
#13 /var/www/html/vendor/magento/framework/Config/Data/Scoped.php(97): Magento\Framework\Config\Data\Scoped->_loadScopedData()
#14 /var/www/html/vendor/magento/framework/App/ResourceConnection/Config.php(68): Magento\Framework\Config\Data\Scoped->get()
#15 /var/www/html/generated/code/Magento/Framework/App/ResourceConnection/Config/Proxy.php(95): Magento\Framework\App\ResourceConnection\Config->getConnectionName('default')
#16 /var/www/html/vendor/magento/framework/App/ResourceConnection.php(96): Magento\Framework\App\ResourceConnection\Config\Proxy->getConnectionName('default')
#17 /var/www/html/vendor/magento/framework/Lock/Backend/Database.php(82): Magento\Framework\App\ResourceConnection->getConnection()
#18 /var/www/html/vendor/magento/framework/Lock/Proxy.php(56): Magento\Framework\Lock\Backend\Database->lock('magento|SYSTEM_...', 0)
#19 /var/www/html/vendor/magento/framework/Cache/LockGuardedCacheLoader.php(134): Magento\Framework\Lock\Proxy->lock('SYSTEM_CONFIG', 0)
#20 /var/www/html/vendor/magento/module-config/App/Config/Type/System.php(281): Magento\Framework\Cache\LockGuardedCacheLoader->lockedLoadData('SYSTEM_CONFIG', Object(Closure), Object(Closure), Object(Closure))
#21 /var/www/html/vendor/magento/module-config/App/Config/Type/System.php(207): Magento\Config\App\Config\Type\System->loadDefaultScopeData('default')
#22 /var/www/html/vendor/magento/module-config/App/Config/Type/System.php(181): Magento\Config\App\Config\Type\System->getWithParts('default/newreli...')
#23 /var/www/html/vendor/magento/framework/App/Config.php(132): Magento\Config\App\Config\Type\System->get('default/newreli...')
#24 /var/www/html/vendor/magento/framework/App/Config.php(80): Magento\Framework\App\Config->get('system', 'default/newreli...')
#25 /var/www/html/vendor/magento/framework/App/Config.php(93): Magento\Framework\App\Config->getValue('newrelicreporti...', 'default', NULL)
#26 /var/www/html/vendor/magento/module-new-relic-reporting/Model/Config.php(94): Magento\Framework\App\Config->isSetFlag('newrelicreporti...')
#27 /var/www/html/vendor/magento/module-new-relic-reporting/Plugin/HttpPlugin.php(49): Magento\NewRelicReporting\Model\Config->isNewRelicEnabled()
#28 /var/www/html/vendor/magento/framework/Interception/Interceptor.php(121): Magento\NewRelicReporting\Plugin\HttpPlugin->beforeCatchException(Object(Magento\Framework\App\Http\Interceptor), Object(Magento\Framework\App\Bootstrap), Object(Exception))
#29 /var/www/html/vendor/magento/framework/Interception/Interceptor.php(153): Magento\Framework\App\Http\Interceptor->Magento\Framework\Interception\{closure}(Object(Magento\Framework\App\Bootstrap), Object(Exception))
#30 /var/www/html/generated/code/Magento/Framework/App/Http/Interceptor.php(23): Magento\Framework\App\Http\Interceptor->___callPlugins('catchException', Array, Array)
#31 /var/www/html/vendor/magento/framework/App/Bootstrap.php(270): Magento\Framework\App\Http\Interceptor->catchException(Object(Magento\Framework\App\Bootstrap), Object(Exception))
#32 /var/www/html/pub/index.php(30): Magento\Framework\App\Bootstrap->run(Object(Magento\Framework\App\Http\Interceptor))
#33 {main} [] []
[2023-03-18T20:08:02.313692+00:00] main.ERROR: Notice: Trying to access array offset on value of type bool in /var/www/html/vendor/colinmollenhour/credis/Client.php on line 1030 [] []
[2023-03-18T20:08:02.314511+00:00] main.CRITICAL: CredisException: A pipeline is already in use and only one pipeline is supported. in /var/www/html/vendor/colinmollenhour/credis/Client.php:994
Stack trace:


aws ssm label-parameter-version --name "/arch/bhn/magento2/REDIS_SESSION_PORT" --labels "disable"

filter=$(aws ssm get-parameters-by-path  --path /arch/bhn/magento2 --query "Parameters[*].Name" --parameter-filters "Key=Label,Option=Equals,Values=disable" | jq -r 'flatten | join ("\\|")')
aws ssm get-parameters-by-path  --path /arch/bhn/magento2 --query "Parameters[*].{Name:Name,Value:Value, Description:Label}"  | jq -r '.[] |  [.Name, .Value, .Description] | @tsv' | grep -v $filter

