install npm:
    cmd.run:
        - name: "curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -"
        - unless: which npm

install nodejs:
    pkg.installed:
        - pkgs:
            - nodejs

language servers:
    npm.installed:
        - pkgs:
            - pyright
