#!/bin/bash
gcloud compute instances list --format=json | gce-list-parser.py