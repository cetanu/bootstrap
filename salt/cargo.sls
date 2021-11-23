install cargo:
  cmd.run:
    - name: 'curl https://sh.rustup.rs -sSf | sh -s -- -y'
    - unless: which cargo
    - runas: {{ pillar['username'] }}

{% for pkg in pillar.get('cargo_packages', []) %}
cargo install {{ pkg }}:
  cmd.run:
    - unless: which {{ pkg }}
    - runas: {{ pillar['username'] }}
{% endfor %}
