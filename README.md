sudo systemctl status docker

volume persistant si je up mon docker-compose, les volumes sont cree et survivent a la durer de vie avant down du docker-compose
si je down sans sotcker le volume ce que j ai up avec pas e.g la DB va etre cree et stocker les data dans le contineur je vais perdre toutes les data
en creant un voume avec "volumes" si je down maintenant le docker-compose les volumes vont donc etre stocker "/path/" et vont pouvoir donc etr edisponible si je re up le docker-compose et retrouver ses data