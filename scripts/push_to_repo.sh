#!/bin/bash

git config user.email "action@github.com"
git config user.name "GitHub Actions"
git add .
git commit -m "Workflow complete. Changed version to $1"
git push origin master
