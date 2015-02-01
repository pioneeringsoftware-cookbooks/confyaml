# Defines exactly where the YAML (or JSON) configuration files will
# appear. Defines a root folder. The cookbook will create the directory if it
# does not already exist.
default['confyaml']['root'] = '/etc/conf'

# Does nothing by default.
default['confyaml']['files'] = {}
default['confyaml']['roles'] = {}
