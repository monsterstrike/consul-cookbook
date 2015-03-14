Chef::Platform.set platform: :ubuntu,
                   resource: :consul_service,
                   provider: Chef::Provider::ConsulServiceUpstart
Chef::Platform.set platform: :centos,
                   version: '>= 5.0',
                   resource: :consul_service,
                   provider: Chef::Provider::ConsulServiceSysvinit
Chef::Platform.set platform: :centos,
                   version: '>= 7.0',
                   resource: :consul_service,
                   provider: Chef::Provider::ConsulServiceSystemd
Chef::Platform.set platform: :redhat,
                   version: '>= 5.0',
                   resource: :consul_service,
                   provider: Chef::Provider::ConsulServiceSysvinit
Chef::Platform.set platform: :redhat,
                   version: '>= 7.0',
                   resource: :consul_service,
                   provider: Chef::Provider::ConsulServiceSystemd
