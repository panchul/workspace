[Home](Readme.md)
# nvm (Node Version Manager)

See Also:

  - [AngularJs](AngularJs.md)
  - [NodeJs](NodeJs.md)
  - [Npm](Npm.md)
  - [ReactJs](ReactJs.md)

[https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)

---

**Contents**

- [Installing](Nvm.md#installing)
- [Miscellaneous](Nvm.md#miscellaneous)

---

## Installing 

---

Here's the link with the Install and Update script:

https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating

---

You can use an [Ansible](Ansible.md) task:

```yaml
- name: Install nvm
  ansible.builtin.shell: >
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  args:
    creates: "{{ ansible_env.HOME }}/.nvm/nvm.sh"
```

## Miscellaneous

---

```bash
nvm install 12.16.3
nvm use 12.16.3
...
```