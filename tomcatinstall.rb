package 'java-1.7.0-openjdk-devel'

group 'chef'do
end

user 'chef' do

end

directory '/tmp' do
end

remote_file "/tmp/apachetomcat8.tar.gz" do
   source "http://ftp.wayne.edu/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz"
end

directory '/opt/tomcat' do
end

execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'

execute 'chgrp -R tomcat conf'

directory 'opt/tomcat/conf' do
mode '0070'
end

execute 'chmod g+r /opt/tomcat/conf/*'
execute 'chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work /opt/tomcat/temp/ /opt/tomcat/logs'

execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'

template '/etc/systemd/system/tomcat.service' do
source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

service 'tomcat' do
action [:start, :enable]
end

