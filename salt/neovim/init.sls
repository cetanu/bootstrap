neovim:
  pkg.latest

{% for file in ['init.lua'] %}
neovim {{ file }}:
  file.managed:
    - name: {{ pillar['homedir'] }}/.config/nvim/{{ file }}
    - source: salt://neovim/files/{{ file }}
    - user: {{ pillar['username'] }}
{% endfor %}


neovim install plugins:
  cmd.run:
    - name: 'nvim +PackerInstall +PackerSync +qall'
    - creates: 
        - {{ pillar['homedir'] }}/.config/nvim/plugin
    - runas: {{ pillar['username'] }}


