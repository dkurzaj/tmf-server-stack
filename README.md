# Trackmania Forever server docker stack
## Prerequisites
Have docker and docker-compose installed.
## Usage
Build the xaseco image:
```
$ cd xaseco
$ ./build-image.sh
$ cd ..
```
Configure your server settings by editing the `docker-compose.yml` and the game settings in: `GameData/Tracks/MatchSettings/custom_game_settings.txt`
Run the stack:
```
$ docker-compose up
```