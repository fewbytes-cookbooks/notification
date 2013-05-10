notification "testing notification lwrp" do
  subject "chef test"
  topic node["notification_test"]["sns"]["topic_arn"]
  user node["notification_test"]["sns"]["access_key_id"]
  password node["notification_test"]["sns"]["secret_access_key"]
  provider "sns"
end
