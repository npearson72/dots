#!/bin/sh
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
    export task_arn=$(command aws ecs list-tasks \
      --cluster web-app-$env-ecs-cluster \
      --service web-app-$env-ecs-service \
      --region $AWS_REGION \
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

  command aws ecs update-service \
    --cluster web-app-$env-ecs-cluster \
    --service web-app-$env-ecs-service \
    --region $AWS_REGION \
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

  command aws ecs execute-command \
    --region $AWS_REGION \
    --cluster web-app-$env-ecs-cluster \
    --task $task_arn \
    --container web-app-$env-ecs-container \
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

  command aws ecs describe-tasks \
    --cluster web-app-$env-ecs-cluster \
    --region $AWS_REGION \
    --tasks $task_arn

  unset env task_arn
}

denote() {
  if [[  ! $1 =~ ^(sh|shell|desc|dt|forc|fd)$ ]]; then
    echo "Usage:";
    echo "  denote [commands]";
    echo ""
    echo "Available commands:";
    echo "  shell|sh  Connect to shell in container";
    echo "  desc|dt   Describe task";
    echo "  force|fd  Force new deployment";

    return 1
  fi

  if [[  ! $2 =~ ^(production|preflight)$ ]]; then
    echo "Usage:";
    echo "  denote $1 [commands]";
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
