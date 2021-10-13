# qlima

## Android Build

### Create an upload keystore
```shell
  keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload-qlima
```
