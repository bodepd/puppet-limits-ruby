# I still need to create the regex mapper for title => namevar
resources { 'limits':
  purge => true
}
#host { 'foo':
#  ip => '127.0.0.2'
#}
limits { 'dan/hard/foo':
  value => '3'
}
limits { 'bob/hard/items':
  value => '4'
}
