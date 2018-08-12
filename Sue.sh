#!/bin/bash
echo "Setting up static networking for Sue"
echo""

address='192.168.12.1'

ifconfig eth0 down;
ifconfig eth0 $address;
ifconfig eth0 up;

echo "I think its done. Type ifconfig and see if it makes sense."