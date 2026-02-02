#!/bin/bash

echo "Diretorios sendo criados"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Grupo de usuarios sendo criado"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando users e atribuindo ao Grupo"

useradd LeoAdm -m -s /bin/bash -p $(openssl passwd -6 123) -G GRP_ADM
useradd MariaAdm -m -s /bin/bash -p $(openssl passwd -6 123) -G GRP_ADM
useradd JoseAdm -m -s /bin/bash -p $(openssl passwd -6 123) -G GRP_ADM

useradd GilVen -m -s /bin/bash -p $(openssl passwd -6 234) -G GRP_VEN
useradd BrunoVen -m -s /bin/bash -p $(openssl passwd -6 234) -G GRP_VEN
useradd MarioVen -m -s /bin/bash -p $(openssl passwd -6 234) -G GRP_VEN

useradd RobSec -m -s /bin/bash -p $(openssl passwd -6 345) -G GRP_SEC
useradd ThaisSec -m -s /bin/bash -p $(openssl passwd -6 345)  -G GRP_SEC
useradd FelipeSec -m -s /bin/bash -p $(openssl passwd -6 345) -G GRP_SEC

echo "Inserindo as permissoes dos diretorios"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Encerrado!"
echo "Encerrado!"

