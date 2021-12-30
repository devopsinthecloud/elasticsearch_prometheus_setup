So you want to set up Prometheus monitoring for your ElasticSearch cluster.
Let's automate this process!

Check your Linux arch first
uname -m

check ES version:
sudo /usr/share/elasticsearch/bin/elasticsearch --version

run the first script
./es_and_prometheus.sh

then edit your Prom config
sudo nano /etc/prometheus/prometheus.yml

To monitor ES cluster, add this: (but put your relevant IPs)

- job_name: "es_metrics"
    scrape_interval: "15s"
    metrics_path: "/_prometheus/metrics"
    static_configs:
    - targets: ['ip1:9200','ip2:9200','ip3:9200']

  - job_name: "es_node"
    metrics_path: "/metrics"
    scrape_interval: "15s"
    static_configs:
    - targets: ['ip1:9100','ip2:9100','ip3:9100']

Save and exit

and run the second script

./install_es_plugin.sh
