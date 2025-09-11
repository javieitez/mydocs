## Handlers

A handler is, to put it that way, a subtask that can only be triggered by another task.

Handlers are declared at the beggining of the playbook or in a separate file
```
---
- hosts: frontends
  become: true
 handlers:
    - name: Reload nginx
      service:
        name: nginx
        state: reloaded
```
The handler doesn't run by default. It is triggered by another task
```
- name: Configure nginx
      template:
        src: nginx-default.j2
        dest: /etc/nginx/sites-available/default
        mode: u=rw,g=r,o=r
      notify: "Reload nginx"
```
In the example above, the template is uploaded only when the file is different than the one on the server. This triggers the handler to reload the Nginx service only when is required.

Handlers can be triggered by multiple tasks, but by default they only run once at the end of the playbook. To run a handler at a different point of it, add a `meta` task
```
- meta: flush_handlers
```

This triggers all handlers and resets their status.

## Trigger more than one handler
A task can only notify one handler. To make it trigger several of them, at the end of each handler, add a topic they listen to
```
      listen: "Reload web services"
```
Then trigger the topic instead of each hadler's names
```
      notify: "Reload web services"
```
Handlers will always run in the order they appear in the playbook

{{ myvariable | default('This is the default value') }}
```
The default only applies if the variable was undefined. Otherwise, it will keep the original value. I.E: This is useful when different hosts return different facts.
