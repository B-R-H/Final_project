#!/bin/bash
printf "[nginx]\n$(terraform output nginx-pip)\n\n" > inventory
printf "admin username:"
read AUN
printf "[nginx:vars]\nansible_user=${AUN}\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\nansible_ssh_private_key_file=~/.ssh/id_rsa\n\n" >> inventory
printf "[DC]\n$(terraform output DC-pip)\n\n" >> inventory
printf "[DC:vars]\nansible_user=${AUN}\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\nansible_ssh_private_key_file=~/.ssh/id_rsa\n\n" >> inventory