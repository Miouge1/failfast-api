#!/bin/bash
PORT=${PORT:-5000}
CELERY_BROKER_URL=${CELERY_BROKER_URL:-redis://}
CELERY_BACKEND_URL=${CELERY_BACKEND_URL:-redis://}
GITHUB_CONTEXT=${GITHUB_CONTEXT:-gitlab-ci}
GITLAB_TOKEN=${GITLAB_TOKEN:-mytoken}
GITLAB_USER=${GITLAB_USER:-myusername}
GITLAB_REPO=${GITLAB_REPO:-ant31/hub2lab}

CELERY_BROKER_URL=$CELERY_BROKER \
           GITLAB_REPO=$GITLAB_REPO \
           GITHUB_CONTEXT=$GITHUB_CONTEXT \
           GITLAB_TOKEN=$GITLAB_TOKEN \
           celery -A hub2labhook.jobs.runner worker -l debug
