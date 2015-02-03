#-------------------------------------------------------------------------------
#
# Cookbook Name:: confyaml
#        Recipe:: files
#
#-------------------------------------------------------------------------------
#
# Copyright (c) 2015, Pioneering Software, United Kingdom. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either expressed or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#
#-------------------------------------------------------------------------------

node['confyaml']['files'].each do |key, value|
  # This is where the "magic" happens. Interpret the key and value.
  value ||= {}
  value = {'node_keys' => value} if value.is_a?(String)
  path = value['path'] || key
  node_keys = value['node_keys'] || path[0...-File.extname(path).length]
  path = File.join(value['root'] || node['confyaml']['root'], path)
  node_keys = node_keys.split('/') if node_keys.is_a?(String)
  attributes = node_keys.inject(node) { |node, node_key| node[node_key] }
  root_key = value['root_key']
  unless root_key
    root_keys = value['root_keys']
    if root_keys
      root_keys = root_keys.split('/') if root_keys.is_a?(String)
      root_key = root_keys.inject(node) { |node, node_key| node[node_key] }
    end
  end
  attributes = {root_key => attributes} if root_key
  node.set['confyaml']['files'][key]['expand_path'] = File.expand_path(path)

  directory File.dirname(path) do
    recursive true
  end

  template path do
    source "conf#{File.extname(path)}.erb"
    variables(attributes: attributes)
  end
end
