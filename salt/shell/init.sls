fish:
    pkg.installed

change shell:
    user.present:
        - name: {{ pillar['username'] }}
        - shell: /usr/bin/fish

create fish config directory:
    file.directory:
        - name: {{ pillar['homedir'] }}/.config/fish

manage fish configuration:
    file.managed:
        - name: {{ pillar['homedir'] }}/.config/fish/config.fish
        - source: salt://shell/files/config.fish
