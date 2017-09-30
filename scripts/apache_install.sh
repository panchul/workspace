#!/usr/bin/env bash

sudo apt-get -y install apache2

if [ $# -gt 0 ]; then
    export SERVER_ID=$1
else
    export SERVER_ID="undefined"
fi

sudo sh -c "cat > /var/www/html/index.html " << EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <title>"${SERVER_ID}"</title>
</head>
<body>
This is web server number "${SERVER_ID}"
<br>
(refresh the page to see if it is loadbalanced and/or cached)
</body>
</html>  
EOF


# start the server
#sudo service apache2 start
