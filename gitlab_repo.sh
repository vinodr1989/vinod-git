#!/bin/bash
# Download Repositories in group
project_dir=workspace # Replace with desired directory name

# Create a Directory to store the files in Group
mkdir -p $project_dir

cd $project_dir

# Download List of repositories in the group to projects.json file Update Private Key and Group ID
curl -H "PRIVATE-TOKEN: <PVT TKN>" \
"https://gitlab.com/api/v4/groups/<Group ID>/projects?per_page=100" | jq \
'map({ id: .id, name: .name, ssh_url: .ssh_url_to_repo, http_url: .http_url_to_repo })' > projects.json

# Clone the Repositories into the desired Directory
cat projects.json | jq ".[].http_url" -r | xargs -I {} git clone {}

# Cleanup the repo list once download is completed
rm -rf projects.json

# Note this script doesnot download sub groups. If sub group is present Run this script for the sub group repo download
