directory '/etc/yum.repos.d/' do
end

template 'mongodb-org-3.4.repo'
source 'mongodb-org-3.4.service.erb'
end

package 'mongodb-org' do
end

service 'mongod' do
action [:start]
end

execute 'chkconfig mongod on'

service 'mongod'do
action [:stop]
end

service 'mongod' do
action [:restart]
end

execute './bin/mongo'


