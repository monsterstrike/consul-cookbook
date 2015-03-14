#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#
require_relative 'helpers'

class Chef::Provider::ConsulConfig < Chef::Provider::LWRPBase
  use_inline_resources if defined?(use_inline_resources)

  include ConsulCookbook::Helpers

  def whyrun_supported?
    true
  end

  action :create do
    directory ::File.dirname(new_resource.path) do
      recursive true
      owner parsed_run_user
      group parsed_run_group
      mode '0644'
    end

    # TODO: (jbellone) Figure out a better way to generate this set of
    # options. Right now this is a bit messy. Especially if options
    # are added after the fact.
    invalid_options = [:path, :run_user, :run_group]
    configuration = new_resource.to_hash.reject { |k, v| invalid_options.include?(k) }
    file new_resource.path do
      owner parsed_run_user
      group parsed_run_group
      content JSON.pretty_generate(configuration, quirks_mode: true)
      mode '0600'
      action :create
    end
  end

  action :delete do
    file new_resource.path do
      action :delete
    end
  end
end
