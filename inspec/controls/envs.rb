control "check envs" do
    describe os_env("ACTION") do
        its('content') { should_not eq nil }
    end
end
