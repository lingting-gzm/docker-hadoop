FROM openjdk:8

ADD hadoop /opt/hadoop

RUN mkdir ~/.ssh && echo -e "-----BEGIN RSA PRIVATE KEY-----\n\
MIIEpAIBAAKCAQEAv3OcQaWXBhRXZow0QJSTdvkZE8py9LbQ4EnyzezyewWPya9L\n\
7PvQXonaFABYJhkCszHOwJqKJe+Z8Rlv5+oshaF2aKjaCP1j42rshZKerwWzbVvy\n\
tasviOWGWjF1HvonYjbxpnIOkN2cMBdfyQRz14s7KZgVgD0QQ/Vw6I+d3XoLvKXn\n\
PMNHBuk3czLlGPuTYbB4K7Fq98T6XOrDcQulQgRKm3lqR+yxonVTchoJ7Ta1VDPk\n\
U3z+qzcmm2cU500D4fvQTi2Ytak/NZvi5FvNdpDw9AeFd2yKXw8NNsqEzRR2qyQl\n\
MEPS45cr3TFNjwEGYKOCu9vC34W5rVUbpVvElwIDAQABAoIBAQCAWWFIIVs+GCT/\n\
+r6NDQ5PlG/bdL3ckTM3Klw88b0d/HyJGZwtJCRtPL2W6yQtZlcJCzswpGo5RIhP\n\
ul3rfHKco8JeJ9UEcduleulWIxV/ALNpfVsZr8oOXNHVZZK/UbVVgsA+dfiN5gPv\n\
ubvdZ77BofXnzK2da1KcPM+VGbMb5qr+G8A72yVoN040Y0K7wY3zB2P6Gu5xWKcb\n\
BQMkvpTbeM3bkM1VKXrp+0ck1t6Ck+Rp4C6p6jRFxwCQfPYw1Vyv5BbHK3zFUHUD\n\
JRHWm1KSAKvxgYftI0+Zynhg6XxDMOsFl7KdoI9riIiAWNhN4BFfHmYAr1U7Ap2t\n\
7oxwQ78BAoGBAPtLbQ0XgQUOJZ0H6lCarIBS2v63n2zJ/38gk8kgcHVkZ/IBeIVD\n\
JM4ZY1BTXTHVF9UxM3Pfz9ZUtwZauptCQp250bM1Hxz9tvUsV32kr1wgW4w9WIib\n\
cUOHjhkan7WzCKuu115Gne36sHaqk5PVdD7fPPpHjtMmeuMl2H8WNKoNAoGBAMMJ\n\
VBV8i7Z8O4xd8Y7n0PnEUJX41MlXTyCw/R4+UuFnUeWguT6q9sgDcNEmZNGbRrxZ\n\
ysjFkiHnxmG/Sizun0vWHuM7WcmO2YYldMBDU3N/HbnRFNRQQ0Q/lD0iH3OqeGmG\n\
odhQpRKFMhrDS7qeL46kXJ8FPJZZ/7GD33bnEHQzAoGBAOsYJW2aD5orIgVG4m+G\n\
RNvIqBiksQGV+PF2CMyhDJTG2ngN6DLEHiqylbcQRp/YO/O3k+tT950MpC3Ns8aM\n\
tsXYkdaWXAVDV2cHlNJ2v5fwrbUFr04eHliO+OGDhub2F6aGa/ZHGnkJjw11h5tG\n\
lvo631FGoNfpqA3Z2jELFToBAoGACkdtlQxRWLbHdKhm2L9C9kbwcFcC7/GYDAMH\n\
9BYYzCRj3pRP7wuXogb8ZSl+2sUyPy8ETvyKrRrIC9LHGAMjhh2s1xEDtGnA8R78\n\
Pj3OIiIq8OYiEOaCBRDMwUQRIEl1uyoLUZk+efFnKJ3uWdGIdB4Ze5ANF2d64GIw\n\
3tViup0CgYAjWXxd1BcFqIaG8LPPF8Xuc33Gf89pFwawraxOifS6mWzw7Q9EhEYY\n\
yJxLUXs0Dn95eZyI0VMGN6P4ZUKc/eaQ99n9c5RqRIdMgjhs4YIgJnf/cVJNYBNb\n\
gyGb99+Cryq2DlZkQ475R8/19IhGD9IZTLn95X74r61N3+8XUNOpAA==\n\
-----END RSA PRIVATE KEY-----" > ~/.ssh/id_rsa && \
 echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/c5xBpZcGFFdmjDRAlJN2+RkTynL0ttDgSfLN7PJ7BY/Jr0vs+9BeidoUAFgmGQKzMc7Amool75nxGW/n6iyFoXZoqNoI/WPjauyFkp6vBbNtW/K1qy+I5YZaMXUe+idiNvGmcg6Q3ZwwF1/JBHPXizspmBWAPRBD9XDoj53degu8pec8w0cG6TdzMuUY+5NhsHgrsWr3xPpc6sNxC6VCBEqbeWpH7LGidVNyGgntNrVUM+RTfP6rNyabZxTnTQPh+9BOLZi1qT81m+LkW812kPD0B4V3bIpfDw02yoTNFHarJCUwQ9LjlyvdMU2PAQZgo4K728LfhbmtVRulW8SX moppo@storm1" \
    > ~/.ssh/id_rsa.pub && cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys &&\
  echo "#hadoop \nexport HADOOP_HOME=/opt/hadoop \nexport PATH=\$HADOOP_HOME/bin:\$PATH" >> /etc/profile && \
  echo "source /etc/profile" >> ~/.bashrc && \
  echo "#!/bin/bash\nmkdir -p \$1 \nmkdir -p \$2 \nif [ \"\`ls -A \$1\`\" == \"\" ]; then \n  echo 'format '\$1' '\$2 \n  /opt/hadoop/bin/hdfs namenode -format \nfi\n/opt/hadoop/bin/hdfs namenode" > /init.sh && \
  chmod +rwx /init.sh
