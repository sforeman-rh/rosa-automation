# rosa-automation

Steps:
1. Ensure rosa, git, oc,terraform, and ocm are installed
	scripts/verify-prerequisites.sh

2. Duplicate the following files:
	cp gitops/template-github-connection-secret.yaml gitops/github-connection-secret.yaml
	cp python-sample/manifests/template-github-creds-secret.yaml python-sample/manifests/github-creds-secret.yaml
	cp quay/template-config-secret.yaml quay/config-secret.yaml
	cp scripts/template-create-cluster.sh scripts/create-cluster.sh
	cp scripts/template-destroy-cluster.sh scripts/destroy-cluster.sh

	manually edit each of the new files and fill in secret info

3. Update scripts/create-cluster.sh with desired values & run (takes around 40 minutes to complete)
4. Create an admin user either through rosa CLI or console.redhat.com (takes around 5 minutes to take effect)
5. Update scripts/post-install.sh with desired values & run (note that there will be some errors while things are installing)
6. Go to ROSA console & enable any console plugins (used by pipelines, logging, and ACM)
7. Rerun scripts/post-install.sh to create any failed objects
8. Optional - copy event listener route for python-sample and create a Github webhook
9. Optional - test CICD pipeline by sending a push to the repo (note - pings do not work, must be a push)
10. Optional - cleanup by updating destroy-cluster.sh & running the script

Known bugs / future enhancements:

- Need to further test cluster destroy
- Automate S3 bucket for quay
- First CICD deployment may fail from deployment timeout
- Enable console plugins programatically?
- Include more options when creating cluster / simplifying variables
- Quay uses too many resources
- Logging doesn't deploy correctly by default
- Connect python-sample with Quay and logging
- Include ACM
- Connect python-sample with argoCD
- Enable further monitoring
- Automate post-install tasks (including creating admin user)
- Switch scripts to Ansible?

