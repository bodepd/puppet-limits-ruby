require 'puppet/provider/parsedfile'

#limits_conf = '/etc/security/limits.conf'
limits_conf = '/tmp/foo.conf'
Puppet::Type.type(:limits).provide(
  :parsed,
  :parent => Puppet::Provider::ParsedFile,
  :default_target => limits_conf,
  :filetype => :flat
) do

    confine :exists => limits_conf
    text_line :comment, :match => /^\s*#/;
    text_line :blank, :match => /^\s*$/;

    record_line :parsed, 
                :fields => %w{name type item value}, 
                :joiner => ' ', 
                :separator => /\s+/
end
