def lookup_provider_constant(name)
  begin
    self.class.provider_base.const_get("Notification" + convert_to_class_name(name.to_s))
  rescue NameError => e
    if e.to_s =~ /#{Regexp.escape(self.class.provider_base.to_s)}/
      raise ArgumentError, "No provider found to match '#{name}'"
    else
      raise e
    end
  end
end

attribute :message, :name_attribute => true, :kind_of => String
attribute :user, :required => false, :default => nil, :kind_of => String
attribute :password, :required => false, :default => nil, :kind_of => String
attribute :topic, :required => true, :kind_of => String
attribute :endpoint, :required => false, :kind_of => String
attribute :subject, :required => false, :kind_of => String

actions :send
default_action :send

def initialize(*args)
  super
  provider "sns"
end
