# SABnzbd for Docker
This image (like all other of my images) is created to run on Synology Docker. I've tried to keep the images clean (so proper config volumes and always the same external volumes).

Image is based on Ubuntu 16.04 LTS.

### Volumes
- /config
- /volumes/incomplete
- /volumes/complete
- /volumes/watch

(config volume hardcoded into startup CMD)

### Ports
- 8080

### Run
Image can be run as follows:
```
docker run --name sabnzbd \
    -p 8080:8080 \
    -v <your directory>:/config \
    -v <your directory>:/volumes/incomplete \
    -v <your directory>:/volumes/complete \
    -v <your directory>:/volumes/watch \
    connorxxl/sabnzbd
```
