#!/bin/bash

# Include the "demo-magic" helpers
source demo-magic.sh

DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
TYPE_SPEED=30

function comment() {
  cmd=$DEMO_COMMENT_COLOR$1$COLOR_RESET
  echo -en "$cmd"; echo ""
}

clear

comment "# check the K8sGPT version installed:"
pe 'k8sgpt version'

comment "# check k8sgpt authentication with an AI backend is set up"
pe 'k8sgpt auth list'

comment "# ensure you have access to a cluster"
pe 'kubectl get nodes'
echo

comment "# analyse cluster right now"
pe 'k8sgpt analyse --explain'
echo

comment "# apply broken pod"
pe 'kubectl apply -f podtato.yaml'

comment "# get the pods in the podtato-kubectl namespace"
pe 'kubectl get pods -n podtato-kubectl'
echo

comment "# access events of the deployment"
pe 'kubectl describe deployment podtato-head-frontend -n podtato-kubectl'
echo

comment "# analyse the cluster again"
pe 'kubectl get events -n podtato-kubectl'
echo

comment "# analyse the cluster again"
pe 'k8sgpt analyse --explain'
echo

comment "# use filters"
pe 'k8sgpt analyze --explain --filter=Pod --namespace=podtato-kubectl'
echo

comment "# use filters"
pe 'k8sgpt analyze --explain --filter=Pod --namespace=podtato-kubectl -output=json --anonymize'
echo

comment "# create the service account"
pe 'kubectl create sa podtato-kubectl -n podtato-kubectl'
echo

comment "# analyse the cluster again"
pe 'k8sgpt analyse --explain'
echo

comment "# analyse the cluster again"
pe 'kubectl delete -f podtato.yaml'
echo

## Integration

comment "# list integrations"
pe 'k8sgpt integrations list'
echo

comment "# activate Trivy"
pe 'k8sgpt integrations activate trivy'
echo

comment "# access all information in the trivy namespace"
pe 'kubectl get all -n trivy-system'
echo

comment "# access filters provided by the trivy integration"
pe 'k8sgpt filters list'
echo

comment "# use the vulnerability report filter"
pe 'k8sgpt analyze --filter VulnerabilityReport'
echo
