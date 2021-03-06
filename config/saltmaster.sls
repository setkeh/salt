/etc/salt/master:
  file.managed:
    - source: salt://files/etc/salt/master
    - user: root
    - group: root
    - mode: 640

/etc/salt/master.d/salt-api.conf:
  file.managed:
    - source: salt://files/etc/salt/master.d/salt-api.conf
    - user: root
    - group: root
    - mode: 640

saltmasterpublic:
  firewalld.present:
    - name: public
    - default: True
    - masquerade: False
    - ports:
      - 22/tcp
      - 4505/tcp
      - 4506/tcp
      - 80/tcp

restartsaltmasterfirewall:
  module.run:
    - name: service.restart
    - m_name: firewalld

salt-master:
  service.running:
    - enable: True

salt-api:
  service.running:
    - enable: True
