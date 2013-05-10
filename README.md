# notification cookbook
A notification LWRP for easy notifications. Currently only one provider exists (AWS SNS) but I plan to add more.

# Usage
The notification LWRP can be declared or notified like any other LWRP:

    notification "App deployed on #{node.name}" do
        subject "depoyments"
        user "username"
        password "very-secret"
        topic "arn:aws:sns:us-east-1:3930843908432098:test"
        provider "sns"
        action :nothing
        subscribes :send, "deploy_revision[my_app]", :immediately
    end

# Author

Author:: Avishai Ish-Shalom <avishai@fewbytes.com>
