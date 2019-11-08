control "vnet" do
  describe azurerm_virtual_network(resource_group: "postgresql-database-deutsche-bank", name: 'example-vnet') do
      it               { should exist }
      its('location')  { should eq 'uksouth' }
      its('address_space') { should eq ["10.10.10.0/24"] }
    end
end
control "subnet" do
  describe azurerm_subnet(resource_group: 'postgresql-database-deutsche-bank', vnet: 'example-vnet', name: 'subnet') do
      it { should exist }
      its('type') { should eq 'Microsoft.Network/virtualNetworks/subnets' }
      its('address_prefix') { should eq "10.10.10.0/24" }
    end
end
control "security-group" do
  describe azurerm_network_security_group(resource_group: 'postgresql-database-deutsche-bank', name: 'example-nsg') do
      it { should exist }
      its('security_rules') { should_not be_empty }
      it { should_not allow_ssh_from_internet }
      it { should_not allow_rdp_from_internet }
    end
end
