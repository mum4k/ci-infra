#!/usr/bin/env bash

# This is a template of an initialization script used by the Salvo Control VMs.

set -e

function terminate {
    # Terminate instances in 1 min
    shutdown -h +1
}
trap terminate EXIT


# shellcheck source=ami-build/scripts/run-fun.sh
. /usr/local/share/run-fun.sh

AWS_DEFAULT_REGION="$(aws_get_region)"
export AWS_DEFAULT_REGION


# shellcheck disable=SC2154
agent_start_minimal \
    "${azp_pool_name}" \
    "${asg_name}" \
    "${instance_profile_arn}" \
    "${role_name}"
