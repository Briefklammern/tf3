[webservers]

%{~ for n in webservers ~}
${n.name} ansible_host=${n.ip}  ansible_fqdn=${n.fqdn}

%{~ endfor ~}

[databases]

%{~ for n in databases ~}
${n.name} ansible_host=${n.ip}  ansible_fqdn=${n.fqdn}

%{~ endfor ~}

[storage]

%{~ for n in storage ~}
${n.name} ansible_host=${n.ip}  ansible_fqdn=${n.fqdn}

%{~ endfor ~}


[all:vars]
ansible_user=ubuntu
ansible_ssh_extra_args="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
ansible_python_interpreter=/usr/bin/python3