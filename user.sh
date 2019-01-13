#!/bin/bash
# ./user.sh

# Ssh user setup: to access to 42's git server (vogsphere)
mkdir -p ~/.ssh &&
cat >> ~/.ssh/config << EOF
# 42 vogsphere
Host vogsphere.42.us.org, vogsphere-exam.42.us.org, vgs.42.us.org, vgse.42.us.org
	StrictHostKeyChecking no
EOF
