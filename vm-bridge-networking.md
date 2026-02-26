# Bridge networking

Create a XML file called virbr0.xml with the definition of the bridge interface
```xml
<network>
  <name>virbr0</name>
  <forward mode='bridge'/>
  <bridge name='virbr0'/>
</network>
```

Add and enable bridge interface
```sh
virsh net-define virbr0.xml
virsh net-start virbr0
ip link add virbr0 type bridge
ip address ad dev virbr0 10.25.0.1/24
ip link set dev virbr0 up
```

Add a new network device to the vm :
```xml
<interface type='bridge'>
  <mac address='52:54:00:12:34:56'/>
  <source bridge='virbr0'/>
  <model type='virtio'/>
  <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
</interface>
```