#!/bin/sh

_kube_list() {
  env=${*: 2:1}
  app=${*: 3:1}

  if [ $env = "production" ]; then
    export AWS_PROFILE=AcimaProduction-ProductionDeveloperAccess
    export KUBECONFIG=~/.kube/config-production
    kubectl config use-context production
    acimos images get $app
  else
    export AWS_PROFILE=AcimaNonprod-NonProdDeveloperAccess
    export KUBECONFIG=~/.kube/config
    kubectl config use-context $env
    kubectl get pods --context $env | grep $app
  fi
}

_kube_console() {
  env=${*: 2:1}
  app=${*: 3:1}

  if [ $env = "production" ]; then
    export AWS_PROFILE=AcimaProduction-ProductionDeveloperAccess
    export KUBECONFIG=~/.kube/config-production
    kubectl config use-context production
    image_run_cmd=$(acimos run $app -i latest)
    eval $image_run_cmd
  else
    export AWS_PROFILE=AcimaNonprod-NonProdDeveloperAccess
    export KUBECONFIG=~/.kube/config
    kubectl config use-context $env
    image_run_cmd=$(acimos run $app -i $env)
    eval $image_run_cmd
  fi
}

kube() {
  if [[  ! $1 =~ ^(list|ls|console|c)$ ]]; then
    echo "Usage:";
    echo "  kube [commands]";
    echo ""
    echo "Available commands:";
    echo "  list|ls     List pods";
    echo "  console|c   Connect to Rails console in pod";

    return 0
  fi

  if [[  ! $2 =~ ^(production|dev|learning|preflight|qa|sandbox|staging)$ ]]; then
    echo "Usage:";
    echo "  kube $1 [commands]";
    echo ""
    echo "Available commands:";
    echo "  production";
    echo "  dev";
    echo "  learning";
    echo "  preflight";
    echo "  qa";
    echo "  sandbox";
    echo "  staging";

    return 0
  fi

  if [[  ! $3 =~ ^(ams|amc|bms|customer-portal|lms|merchant-portal)$ ]]; then
    echo "Usage:";
    echo "  kube $1 $2 [commands]";
    echo ""
    echo "Available commands:";
    echo "  amc";
    echo "  ams";
    echo "  bms";
    echo "  customer-portal";
    echo "  lms";
    echo "  merchant-portal";

    return 0
  fi

  case $1 in
    list|ls)
      _kube_list $@
      ;;
    console|c)
      _kube_console $@
      ;;
  esac
}
