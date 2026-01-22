#!/bin/bash
# Create provider bridge for VLAN 3411 on all worker nodes

for node in worker-comp-ceph-01 worker-comp-ceph-02 worker-comp-ceph-03; do
  echo "Creating br-provider on $node..."
  ssh root@$node << 'REMOTE_EOF'
    # Create VLAN interface for provider network
    ip link add link bond0 name bond0.3411 type vlan id 3411
    ip link set bond0.3411 up
    
    # Create provider bridge
    brctl addbr br-provider
    brctl addif br-provider bond0.3411
    ip link set br-provider up
    
    # Make it persistent (add to /etc/network/interfaces or netplan)
    echo "Created br-provider bridge for VLAN 3411"
REMOTE_EOF
done
