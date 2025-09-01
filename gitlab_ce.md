## Restart Gitlab
```
gitlab-ctl reconfigure
```

## Configure repo storage path

Edit `/etc/gitlab/gitlab.rb`

```ruby
git_data_dirs({
 "default" => { "path" => "/var/opt/gitlab/git-data" },
 "storage1" => { "path" => "/mnt/storage1/git-data" },
 "storage2" => { "path" => "/mnt/storage2/git-data" }
    })
```
More than one storage path can be added, comma separated.

When done, `gitlab-ctl reconfigure` to apply the changes


https://docs.gitlab.com/ee/administration/repository_storage_paths.html

## Prometheus log rotation

Edit `/etc/gitlab/gitlab.rb`

```ruby
prometheus['flags'] = {
  'storage.tsdb.path' => "/var/opt/gitlab/prometheus/data",
  'storage.tsdb.retention.time' => "7d",
  'storage.tsdb.retention.size' => "2GB",
  'config.file' => "/var/opt/gitlab/prometheus/prometheus.yml"
}
```
When done, `gitlab-ctl reconfigure` to apply the changes

https://docs.gitlab.com/ee/administration/monitoring/prometheus/
