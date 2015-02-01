# confyaml-cookbook

Creates YAML-based configuration files based on node attributes and roles.

The node attribute `node['confyaml']['files']` defines a hash of key-value
pairs. The key basically provides the name of the configuration file, including
slash-separated sub-folders if necessary. The key also doubles as the default
node sub-key path. Hence key of `a/b/c` selects `node['a']['b']['c']` and
stores the resulting YAML or JSON at `a/b/c` under `/etc/conf`, automatically
creating the sub-folders.

The cookbook can also render JSON configuration files if you specify a `json`
extension. It renders the JSON prettily. This is not just for beauty's sake; it
also makes it easier to see differences when Chef compares old and new looking
for changes.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['confyaml']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### confyaml::default

Include `confyaml` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[confyaml::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
