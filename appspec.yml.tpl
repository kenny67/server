version: 0.0
os: linux
files:
  - source: /
#    destination: /home/ec2-user/work/php/
    destination: /var/www/${PROJECT_NAME}/



hooks:
  Before Install:
    - location: scripts/before_install.sh
      timeout: 300
      runas: root
  After Install:
    - location: scripts/after_install.sh
      timeout: 300
      runas: root
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
  ApplicationStop:
    - location: scripts/stop_server.sh
      timeout: 300
      runas: root
