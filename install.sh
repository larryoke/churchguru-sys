rm certificate17-18.pfx
rm  keystore.jks 
sleep 3

echo "openssl"
openssl pkcs12 -export -out certificate17-18.pfx -inkey faithchapel.churchg.com.key -in faithchapel.churchg.com.crt -certfile faithchapel.churchg.com.ca  -name "tomcat"
sleep 3


echo "keytool -genkey"
keytool -importkeystore -srckeystore certificate17-18.pfx -srcstoretype pkcs12 -srcalias tomcat  -destkeystore keystore.jks -deststoretype JKS  -destalias tomcat
sleep 3 


echo "keytool -importkeystore"
keytool -importkeystore -srckeystore keystore.jks -destkeystore keystore.p12 -srcstoretype JKS -deststoretype PKCS12 -srcstorepass larryoke -deststorepass larryoke -srcalias tomcat -destalias tomcat -srckeypass larryoke -destkeypass larryoke -noprompt
