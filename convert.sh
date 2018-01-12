echo "ID ?"
cd /home/images # Change By your folder
ls
read vmid
cd $vmid
ls  #List folders 

echo "Continue ?r ? (y/n)"
read choix
if [ $choix = "y" ]
then
screen qemu-img convert -p -o compat6 -f qcow2 *.qcow2 -O vmdk $vmid.vmdk

else
echo "Already .vmdk file exist ? "

fi

#Send to another server
echo " Send : XX  ou XX ? (1/2/n)"
read serveur

if [ $serveur = "1" ]
then
screen scp $vmid.vmdk root@IP.Hostname:/vmfs/volumes/5a55653c-44a41860-78b9-3863bb48288c/migration/

elif [ $serveur = "3" ]
then
screen scp $vmid.vmdk root@IP.Hostname:/vmfs/volumes/5a450b6c-ebeee9be-8dc4-3cd92bf2b906/disquens1/

elif [ $serveur = "n" ]
then
echo "Ok, we remove folder ?"

fi



#Remove 
echo " Delete folder  ? (y/n)"
read delete

if [ $delete = "y" ]
then
cd ..
rm -rf $vmid

fi
