rm certificate17-18.pfx
rm  ~/.churchguru-deploy/keystore.jks 
sleep 3

echo "openssl"
openssl pkcs12 -export -out certificate17-18.pfx -inkey faithchapel.churchg.com.key -in faithchapel.churchg.com.crt -certfile faithchapel.churchg.com.ca
sleep 3


echo "keytool -genkey"
keytool -genkey -alias tomcat -keystore ~/.churchguru-deploy/keystore.jks
sleep 3 


echo "keytool -importkeystore"
keytool -importkeystore -srckeystore ~/.churchguru-deploy/keystore.jks -destkeystore ~/.churchguru-deploy/keystore.p12 -srcstoretype JKS -deststoretype PKCS12 -deststorepass larryoke -srcalias tomcat -destalias tomcat
