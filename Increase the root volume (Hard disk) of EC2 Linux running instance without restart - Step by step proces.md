# Increase the root volume (Hard disk) of EC2 Linux running instance without restart - Step by step process

## Here is the solution:

- Take a snapshot of your volume for backup purpose.

- Increase the EBS volume using Elastic Volumes

- After increasing the size, extend the volume's file system manually.


### Snapshot Process
1. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/. 
2.  Choose ``Volumes`` under ``Elastic Block Store`` in the navigation pane.
3. Select the ``Volume`` identify by ``Name`` or ``Volume ID`` .
    > select the ``Action`` and chose ``Create snapshot``.
4. Provide the ``Description`` and Tag is a (optional) select ``Create snapshot``.

5. Verify the Snapshot creation and move to next step.

### Increase the EBS volume using Elastic Volumes

1. Select the ``Volume`` to modify and then choose ``Actions`` to Modify Volume.
2.The Modify Volume window displays the volume ID and the volume's current configuration, including type, size, IOPS, and throughput. Set new configuration values as follows:

- To modify the ``Type``, choose a value for Volume Type.

- To modify the ``Size``, enter a new value for Size.

3. After you have finished changing the volume settings, choose ``Modify``. When prompted for confirmation again choose ``Modify``.
4. Modifying volume size has no practical effect until we extend the volume's file system to make use of the new storage capacity.

### Extend the volume's file system manually

1. Check the volume has a partition that must be extended, use the **``lsblk``** command to display information block devices attached to your instance.

#### Example Output:


[root@ip-centos]# lsblk 

NAME   MAJ:MIN  RM SIZE RO TYPE    MOUNTPOINT
> xvda    202:0    0  30G  0 disk 

> xvda1 202:1    0  10G  0 part /

2. The root volume, /dev/xvda, has a partition, /dev/xvda1. While the size of the root volume reflects the new size, 30 GB, the size of the partition reflects the original size, 10 GB, and must be extended before you can extend the file system.

3. The volume /dev/xvda has no partitions. The size of the volume reflects the new size, 20 GB.

4. For volumes that have a partition, such as the root volume shown in the previous step, use the ``growpart`` command to extend the partition. Notice that there is a ``space between the device name and the partition number``.
    > - ~$ sudo growpart /dev/xvda 1

#### Example Output:
[root@ip-centos]# growpart /dev/xvda 1 
> CHANGED: partition=1 start=2048 old: size=20969439 end=20971487 new: size=62912479 end=62914527

5. To extend the file system on each volume, use the correct command for your file system. In my case, I have ``xfs`` filesystem, I will use the xfs_growfs command.

    >- ~$ xfs_growfs /dev/xvda1
- If you have ``ext4`` filesystem use this command 

    >- ~$ sudo resize2fs /dev/xvda1

6. Know volume type use ``df`` command and verify
    >- ~$ df -hT  

