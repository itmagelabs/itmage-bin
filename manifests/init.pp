# @summary A short summary of the purpose of this class
#
# A description of what this class does
# @param alias
#   Hash of all short names for script
#   {'name-of-script' => ['short-name']}
# @param path
# @param purge
# @param owner
# @param group
#
# @example
#   include bin
class bin (
  Hash $alias = {},
  String $path = '/opt/itmage',
  String $local_bin = '/usr/local/bin',
  Boolean $purge = true,
  String $owner = 'root',
  String $group = 'root'
) {
  file {
    default:
      ensure => directory,
      owner  => $owner,
      group  => $group;
    $path:
      purge  => $purge;
    "${path}/bin":
      mode    => '0755',
      recurse => remote,
      source  => "puppet:///modules/${module_name}/bin";
    "${path}/lib":
      recurse => remote,
      source  => "puppet:///modules/${module_name}/lib"
  }
  $_alias = $alias.reduce({}) |$memo, $kv| {
    $memo + {
      $kv[1].map |$i| { "${local_bin}/${i}"} => {
        target => "${path}/bin/${kv[0]}"
      }
    }
  }
  create_resources('file', $_alias, {
    ensure  => link,
    require => File["${path}/bin"]
  })
}
