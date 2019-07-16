#!/bin/bash

airflow webserver -p 8080 &
airflow scheduler &
jupyter notebook /root/tfx/tfx/tfx/examples/workshop/notebooks --port 8888 --ip=0.0.0.0 --allow-root &

while true
do
sleep 365d
done
