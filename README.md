## Private endpoint DNS infra with Azure Private Resolver for an on-premises workload - with Terraform

#### When an Azure Private Endpoint is created, it uses Azure Private DNS Zones for name resolution by default. For on-premises workloads to access the endpoint, a forwarder to a virtual machine in Azure hosting DNS or on-premises DNS records for the private endpoint were required. Azure Private Resolver alleviates the need to deploy a VM in Azure for DNS or manage the private endpoint DNS records on an on-premises DNS server.

#### Simulation of one On-Prem network and one Cloud network. Peering VNETs simulate VPN.
#### Simulation is done to show how workloads can be accessed through a different network through a private endpoint.

#### The Private Resolver resides in the same VNET as the private endpoint. The resolver receives DNS request from the simulated on-prem network.

#### https://learn.microsoft.com/en-us/azure/private-link/tutorial-dns-on-premises-private-resolver#create-private-endpoint