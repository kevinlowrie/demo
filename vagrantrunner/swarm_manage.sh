#!/bin/sh -x
vagrant ssh master -c '/vagrant/bin/swarm manage --host 0.0.0.0:2378 172.16.70.250:2375,172.16.70.251:2375,172.16.70.252:2375'
