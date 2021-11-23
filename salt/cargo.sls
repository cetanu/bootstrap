install cargo:
  cmd.run:
    - name: 'curl https://sh.rustup.rs -sSf | sh -s -- -y'
    - unless: which cargo
    - runas: {{ pillar['username'] }}
