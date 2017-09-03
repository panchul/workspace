#!/usr/bin/env bash

find . \( \
   \( -path "*.snapshot*" -prune \) \
-o \( -path "*..*" -prune \) \
-o \( -path "*/d.sun*" -prune \) \
-o \( -path "*/o.sun*" -prune \) \
\) \
-o \
-not -type d  \
-not -iname "*.r" \
-not -iname "*.i" \
-not -iname "s.*" \
-not -iname "*.class" \
-not -iname "*.gz" \
-not -iname "*.java" \
-not -iname "*.jar" \
-not -iname "*.o" \
-not -iname "*.a" \
-not -iname "*.so" \
-not -iname "*.DLL" \
-not -iname "*.tar*" \
-not -iname "*.tgz*" \
-not -iname "*.Z"  \
-not -iname "*.old*" \
-not -iname "*.log" \
-not -iname "*.db" \
-not -iname "*.gif" \
-not -iname "*.zip"  \
-not -iname "*.sql"  \
-not -iname "*.exe"  \
-exec grep -l "$1" {} \; 2> /dev/null
