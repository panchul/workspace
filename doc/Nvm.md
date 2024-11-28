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

```bash
% curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 16563  100 16563    0     0  69911      0 --:--:-- --:--:-- --:--:-- 70182
=> Downloading nvm from git to '/Users/apanchul/.nvm'
=> Cloning into '/Users/username/.nvm'...
remote: Enumerating objects: 380, done.
remote: Counting objects: 100% (380/380), done.
remote: Compressing objects: 100% (323/323), done.
remote: Total 380 (delta 43), reused 178 (delta 29), pack-reused 0 (from 0)
Receiving objects: 100% (380/380), 382.75 KiB | 3.61 MiB/s, done.
Resolving deltas: 100% (43/43), done.
* (HEAD detached at FETCH_HEAD)
  master
=> Compressing and cleaning up git repository

=> Appending nvm source string to /Users/username/.zshrc
=> Appending bash_completion source string to /Users/username/.zshrc
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

Check it is there:

```bash
% nvm --version
0.40.1
```

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