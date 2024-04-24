# K8sGPT full tutorial

You can find the full tutorial under the following links:
YouTube - video tutorial: TBD
Anais' Blog - writtern tutorial: TBD

## Give us a star

Make sure to give the K8sGPT project a star on GitHub:
https://github.com/k8sgpt-ai/k8sgpt 

## Automated Trivy Demo

We have set up an automated demo that runs the different commands for you. The instructions are provided below.

Please ensure that you are connected to a Kubernetes cluster.

# MacOS:
brew install pv

# Ubuntu:
apt-get install pv

Link to the project repository: https://github.com/paxtonhare/demo-magic

Also, the script has to be executable:

chmod +x sample.sh

And then run the script:
```
./k8sgpt.sh
```

Port-forward podtato head application:
```
kubectl port-forward service/podtato-head-entry -n podtato-kubectl 9000
```

## Additional Resources
Documentation: https://docs.k8sgpt.ai/SlackGitHub Organisation: https://github.com/k8sgpt-ai
Website: https://k8sgpt.ai/