#!/usr/bin/env bash

# http://spark.apache.org/downloads.html
# http://www.apache.org/dyn/closer.lua/spark/spark-1.6.2/spark-1.6.2.tgz
# http://mirror.olnevhost.net/pub/apache/spark/spark-1.6.2/spark-1.6.2.tgz

SPARK_VERSION="1.6.2"
SPARK_NAME="spark-$SPARK_VERSION"
SPARK_INSTALLER_DIR="/vagrant/install"

if [ ! -f "$SPARK_INSTALLER_DIR/$SPARK_NAME.tgz" ]; then
   echo "[INFO] Downloading Spark install, $SPARK_NAME.tgz"
   wget -O "$SPARK_INSTALLER_DIR/$SPARK_NAME.tgz" http://mirror.olnevhost.net/pub/apache/spark/"$SPARK_NAME/$SPARK_NAME.tgz"
else
   echo "[INFO] Skipping downloading Spark, have $SPARK_INSTALLER_DIR/$SPARK_NAME.tgz"
fi

if [ ! -d "/home/vagrant/$SPARK_NAME" ]; then
   echo "[INFO] Installing Spark..."
   tar -zxf $SPARK_INSTALLER_DIR/$SPARK_NAME.tgz
   chown vagrant:vagrant -R "$SPARK_NAME"
   echo "export PATH=\$PATH:/home/vagrant/$SPARK_NAME/bin/" >> /home/vagrant/.bashrc
   echo "[INFO] Installed Spark $SPARK_NAME"
else
   echo "[INFO] Spark already found: /home/vagrant/$SPARK_NAME"
fi
