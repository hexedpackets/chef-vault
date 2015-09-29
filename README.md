# chef-vault
Chef cookbook for managing [Vault](https://vaultproject.io).

In client mode, only the Vault binary will be installed.

In server mode, the binary will be installed, configured, and started as server.
WARNING: The default behavior of the server is to start unconfigured. You must run `vault init` to generate the unseal keys and the initial root token.


###Requirements
#### Platforms
- Debian/Ubuntu

#### Chef
- Chef 11+

#### Cookbooks
- none

### Attributes

#### vault::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:vault][:bin_dir]</tt></td>
    <td>String</td>
    <td>Directory to install the vault binary.</td>
    <td><tt>/usr/local/bin</tt></td>
  </tr>
  <tr>
    <td><tt>[:vault][:version]</tt></td>
    <td>String</td>
    <td>Version of Vault to install.</td>
    <td><tt>0.1.0</tt></td>
  </tr>
  <tr>
    <td><tt>[:vault][:mode]</tt></td>
    <td>String</td>
    <td>Indicates whether to install just the vault binary, or also start it as a server. Valud values are "client" and "server".</td>
    <td><tt>client</tt></td>
  </tr>


  <tr>
    <td><tt>[:vault][:server][:config]</tt></td>
    <td>String</td>
    <td>Location of the configuration file.</td>
    <td><tt>/etc/vault.hcl</tt></td>
  </tr>
  <tr>
    <td><tt>[:vault][:server][:service_name]</tt></td>
    <td>String</td>
    <td>Name of the service as seen by the init system.</td>
    <td><tt>vault</tt></td>
  </tr>
  <tr>
    <td><tt>[:vault][:server][:init_type]</tt></td>
    <td>String</td>
    <td>Init system to run the server under. Currenly only upstart is supported.</td>
    <td><tt>upstart</tt></td>
  </tr>
  <tr>
    <td><tt>[:vault][:server][:oom_score]</tt></td>
    <td>Integer</td>
    <td>OOM score adjustment in the init config.</td>
    <td><tt>-100</tt></td>
  </tr>

  <tr>
    <td><tt>[:vault][:server][:backends]</tt></td>
    <td>Hash</td>
    <td>Name of backends to enable along with their configurations.</td>
    <td><tt>{
  consul: {
    address: "demo.consul.io:80",
    path: "vault"
  }
}</tt></td>
  </tr>
  <tr>
    <td><tt>[:vault][:server][:listeners]</tt></td>
    <td>Hash</td>
    <td>Name of listeners to enable along with their configurations.</td>
    <td><tt>{
  tcp: {
    address: "127.0.0.1:8200",
    tls_cert_file: "/etc/ssl/certificate.crt",
    tls_key_file: "/etc/ssl/key.pem"
  }
}</tt></td>
  </tr>
</table>

### Usage
#### vault::default

Just include `vault` in your node's `run_list`. This will load either `vault::client` or `vault::server` depending on the value of `node[:vault][:mode]`.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vault]"
  ]
}
```
