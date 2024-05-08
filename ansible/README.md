# Ansible 

## Install nethermind and nimbus at the same time

### Review Code Changes
```
ansible-playbook -i hosts/node-eth-testnet node-eth-testnet.yml --diff --limit 'node-eth-holesky-nethermind-01' --tags nethermind,nimbus -v -C
```

### Apply Code Changes
```
ansible-playbook -i hosts/node-eth-testnet node-eth-testnet.yml --diff --limit 'node-eth-holesky-nethermind-01' --tags nethermind,nimbus -v
```

## Upgrade the nethermind and/or nimbus version

### Nethermind
#### Update the following values in `roles/nethermind-service/vars/main.yml` 
```
nethermind_version
nethermind_version_commit
```
#### Apply Code Changes (and best to review code change beforehand)
```
ansible-playbook -i hosts/node-eth-testnet node-eth-testnet.yml --diff --limit 'node-eth-holesky-nethermind-01' --tags nethermind -v
```

### Nimbus
#### Update the following values in `roles/nimbus-service/vars/main.yml` 
```
nimbus_version
nimbus_version_commit
nimbus_dl_checksum
```
#### Apply Code Changes (and best to review code change beforehand)
```
ansible-playbook -i hosts/node-eth-testnet node-eth-testnet.yml --diff --limit 'node-eth-holesky-nethermind-01' --tags nimbus -v
```
