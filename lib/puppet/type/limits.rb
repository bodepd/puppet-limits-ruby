#   def self.title_patterns
#    [
#      [ /^(\S+)\/(hard|soft)\/(\S+)$/, # Set name and protocol
#        [
#          [ :domain, lambda{|x| x} ],
#          [ :type, lambda{ |x| x.intern } ],
#          [ :item, lambda{|x| x} ]
#        ]
#      ],
#    ]
#  end 
Puppet::Type.newtype(:limits) do

  ensurable

  newparam(:name, :namevar => true) do
    desc "Name of the parameter"
  end
     
  newproperty(:type) do

  end

  newproperty(:item) do

  end
  newproperty(:value) do
    desc "Value the parameter should be set to"
  end

  newproperty(:target) do
    desc "Name of the file to store parameters in"
    defaultto { 
      if @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
        @resource.class.defaultprovider.default_target
      else
        nil
      end
    }
  end
end
