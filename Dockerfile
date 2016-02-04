FROM ubuntu:latest
MAINTAINER JONAS ISAIAS <contato@exainfo.com.br>
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql php5-ldap
RUN apt-get -y install php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
EXPOSE 80
ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar xvzf /wordpress.tar.gz
RUN rm -rf /var/www/
RUN mv /wordpress /var/www/
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
CMD /usr/sbin/apache2ctl -D FOREGROUND
