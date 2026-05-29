build cree un "sys" a partir du from nous on ajoute donc un path pour executer notre .sh avec copy directe au from image


Ta machine                    Image (mini debian)
──────────────                ──────────────────
/Users/toi/inception/         /bin/
  ├── Dockerfile               /etc/
  ├── scripts/                 /usr/
  │   └── mariadb.sh  →COPY→  /mariadb.sh   ← seulement ce que tu copies
  └── config/