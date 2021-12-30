#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl restart prometheus
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
cd /usr/share/elasticsearch/ && sudo ./bin/elasticsearch-plugin install -b https://github.com/vvanholl/elasticsearch-prometheus-exporter/releases/download/7.15.2.0/prometheus-exporter-7.15.2.0.zip
sudo systemctl restart elasticsearch && curl http://localhost:9100/metrics
