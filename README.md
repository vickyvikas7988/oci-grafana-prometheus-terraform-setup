<h1> Terraform * OCI * Grafana * Prometheus </h1><br>
<h2>Provision monitoring infrastructure</h2>
<h3>Running this Terraform you will be able to install Grafana dashboard, Prometheus and Alert Manager on OCI (Oracle Cloud Infrastructure)</h3>
<br>

You can access the grafana dashboard <public-ip>:3000

<h3> List of resources would be created </h3>
<ul>
<li>Compartment</li>
<li>VCN</li>
<li>Subnets</li>
<li>Internet Gateway</li>
<li>NAT Gateway</li>
<li>Route Tables</li>
<li>Security Rule Lists</li>
<li>Instances</li>
</ul> 

<h3>Note</h3>
<b>Replace your values in variables.</b>
<b> Replace your SSH public key in scripts/grafana_userdata.yaml and scripts/prometheus_userdata.yaml files.