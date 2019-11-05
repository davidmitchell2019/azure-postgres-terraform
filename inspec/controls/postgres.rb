control "postgres" do                                # A unique ID for this control.                     # A human-readable title
  describe azurerm_postgresql_server(resource_group: input('resource_group'), server_name: input('server_name')) do
      it { should exist }
    end
end
