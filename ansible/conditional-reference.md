```yaml 
  - name: "Install Apache web server (httpd for RedHat, apache2 for Debian/Ubuntu)"
  ansible.builtin.package:
    name: "{{ 'httpd' if ansible_os_family == 'RedHat' else 'apache2' }}"
    state: present
  become: yes
  ```
