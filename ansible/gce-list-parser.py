#!/usr/bin/python

import sys, json
inventory = {'all':{'hosts':{}, 'children':{}}}

instances=json.load(sys.stdin)
for instance in instances:
    host_name = instance['name']
    host_ip = instance['networkInterfaces'][0]['accessConfigs'][0]['natIP']
    tags = instance['tags']['items']
    host = {'ansible_host':host_ip}
    inventory['all']['hosts'][host_name] = host

    for tag in tags:
        if tag != host_name:
            if tag not in inventory['all']['children']:
                invenotory['all']['children'][tag] = {'hosts':{}}
            inventory['all']['children'][tag] = {'hosts':{}}

print json.dumps(inventory)