control "test" do                                # A unique ID for this control.                     # A human-readable title
  describe azurerm_postgresql_server(resource_group: 'inspec-resource-group-9', server_name: 'example_server') do
      it { should exist }
    end
end
