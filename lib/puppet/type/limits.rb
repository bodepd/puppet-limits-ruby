Puppet::Type.newtype(:limits) do

  # maps a title pattern into attributes
  def self.title_patterns
    [
      [ /^(\S+)\/(hard|soft)\/(\S+)$/, # Set name and protocol
        [
          [ :domain, lambda{|x| x} ],
          [ :type, lambda{ |x| x } ],
          [ :item, lambda{|x| x} ]
        ]
      ]
    ]
  end 

  def self.namevar_join(hash)
    "#{hash[:domain]}/#{hash[:type]}/#{hash[:item]}"
  end

  ensurable

  newparam(:domain, :namevar => true) do
    desc "Name of the parameter"
  end
     
  newparam(:type, :namevar => true) do
    #newvalues 'hard', 'soft'
  end

  newparam(:item, :namevar => true) do

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
