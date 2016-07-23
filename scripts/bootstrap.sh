#
# The hoops we have to jump through to make sure occational \r does not matter.
#
mkdir -p tmp 
dos2unix -n /vagrant/scripts/init.sh tmp/init.sh 
#echo -n -e "#include<stdio.h>\n\nmain() {\n\tint c;\n\twhile((c=getchar()) !=-1)\n\tif(c!='\\\\r')\n\tputchar(c);\n}\n" > tmp/convertR.c  
#gcc -o tmp/convertR tmp/convertR.c 
#tmp/convertR < /vagrant/scripts/init.sh > tmp/init.sh 
chmod +x tmp/init.sh 
tmp/init.sh 
