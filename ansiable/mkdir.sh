##
# Ansible playbook for setting up default users on Linux servers
#

- hosts: devHosts
  user: root
#   user: ansible

  tasks:

        - stat: path="/mnt/gfs/COMPANY/download/pull_recordings/latest/VERSION"
          register: folder_exist

        # - fail: msg="Folder not found"
        #  when: folder_exist.stat.exists == False

        - name: Creates directory
          shell: mkdir -p /mnt/gfs/COMPANY/download/pull_recordings/latest/VERSION
          when: folder_exist.stat.exists == False

