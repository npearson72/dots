#!/bin/sh
_aws() {
  command op plugin run -- aws $@
}

_get_arn() {
  opts=(${*: 3})
  env=${*: 2:1}

  if [[ $opts[1] == -arn ]]; then
    export arn=$opts[2]
  fi

  if [[ $opts[1] == --arn=* ]]; then
    arr=(${${opts[1]}//*=/})
    export arn=$arr[1]
  fi

  if [[ -z $arn ]]; then
    echo "\nARN not provided, fetching latest task ARN from ECS service..." >&2
    export task_arn=$(_aws ecs list-tasks \
      --cluster app-$env-ecs-cluster \
      --service app-$env-ecs-service \
      --region us-west-2 \
      --output text \
      --query 'taskArns[0]'
    )
  else
    export task_arn=$arn
  fi

  echo $task_arn
}

_force_new_deployment() {
  env=${*: 2:1}

  _aws ecs update-service \
    --cluster app-$env-ecs-cluster \
    --service app-$env-ecs-service \
    --region us-west-2 \
    --enable-execute-command \
    --force-new-deployment
}

_login_into_fargate_container_shell() {
  env=${*: 2:1}

  task_arn=$(_get_arn $@)

  if [[ -z $task_arn || $task_arn == None ]]; then
    echo "\nNo task ARN found. Exiting..."
    return 1
  fi

  _aws ecs execute-command \
    --region us-west-2 \
    --cluster app-$env-ecs-cluster \
    --task $task_arn \
    --container app-$env-ecs-container \
    --command "sh" \
    --interactive

  unset arn task_arn env opts
}

_describe_task() {
  env=${*: 2:1}

  task_arn=$(_get_arn $@)

  if [[ -z $task_arn || $task_arn == None ]]; then
    echo "\nNo task ARN found. Exiting..."
    return 1
  fi

  _aws ecs describe-tasks \
    --cluster app-$env-ecs-cluster \
    --region us-west-2 \
    --tasks $task_arn

  unset env task_arn
}

fargate() {
  if [[  ! $1 =~ ^(sh|shell|desc|dt|forc|fd)$ ]]; then
    echo "Usage:";
    echo "  fargate [commands]";
    echo ""
    echo "Available commands:";
    echo "  shell|sh  Connect to shell in container";
    echo "  desc|dt   Describe task";
    echo "  force|fd  Force new deployment";

    return 1
  fi

  if [[  ! $2 =~ ^(production|preflight)$ ]]; then
    echo "Usage:";
    echo "  fargate $1 [commands]";
    echo ""
    echo "Available commands:";
    echo "  production";
    echo "  preflight";

    return 1
  fi

  case $1 in
    sh|shell)
      _login_into_fargate_container_shell $@
      ;;
    dt|desc)
      _describe_task $@
      ;;
    fd|force)
      _force_new_deployment $@
      ;;
  esac
}
