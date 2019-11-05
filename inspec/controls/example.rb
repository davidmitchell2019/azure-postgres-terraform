control "test" do                                # A unique ID for this control.                     # A human-readable title
  describe azurerm_postgresql_server(resource_group: 'postgresql-database-deutsche-bank', server_name: 'postgresql-database-deutsche-bank') do
      it { should exist }
    end
end
