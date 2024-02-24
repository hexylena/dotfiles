source_directories:
- ~/.mozilla

repositories:
- path: ssh://zh2879@zh2879.rsync.net/./mk
  label: rsync.net
#- ssh://borg@quark/./backups/hexylena

upload_rate_limit: 2000

exclude_caches: true
exclude_patterns:
    - '*.pyc'
    - node_modules

remote_path: borg1
encryption_passcommand: /home/user/bin/borg-password
relocated_repo_access_is_ok: true

keep_daily: 7
keep_weekly: 4
keep_monthly: 6

checks:
    - name: repository
    - name: archives
      frequency: 2 weeks
