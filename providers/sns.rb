def whyrun_supported?
  true
end

action :send do
  block_name = "Sending SNS message to topic #{new_resource.topic}"
  begin
    require 'aws'
  rescue LoadError
    recipe_eval do
      run_context.include_recipe "xml::ruby"

      chef_gem "aws-sdk"
    end
    require 'aws'
  end

  converge_by(block_name) do
    opts = {:access_key_id => new_resource.user, :secret_access_key => new_resource.password}
    opts.merge!(:region => new_resource.endpoint) if new_resource.endpoint
    sns = AWS::SNS.new(opts)
    Chef::Log.info "Sending message to SNS"
    if new_resource.subject
      sns.topics[new_resource.topic].publish(new_resource.message, :subject => new_resource.subject)
    else
      sns.topics[new_resource.topic].publish(new_resource.message)
    end
  end
end

