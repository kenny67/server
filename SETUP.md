diff --git a/broker/config/wildfirechat.conf b/broker/config/wildfirechat.conf
index 712f84f9..c453bc0b 100755
--- a/broker/config/wildfirechat.conf
+++ b/broker/config/wildfirechat.conf
@@ -12,7 +12,9 @@
 #服务器的接入IP。给客户端提供是${server.ip}和${http_port}。
 #客户端会从${http_port}端口获取到长链接端口。这个地址一定要改成客户端可以访问到的IP地址
 # （如果您部署云服务器上或者具有独立公网出口的服务器上，请改为对应的公网IP；如果您部署在在内网环境下，在内网使用，这个地方改成内网地址）
-server.ip 0.0.0.0
+#server.ip im.naifen360.com
+#server.ip 40.76.70.83
+server.ip localhost
 
 ##原生客户端长链接端口
 port 1883
@@ -36,10 +38,11 @@ host 0.0.0.0
 local_port 80
 
 ##是否使用内置DB。0使用mysql；1使用h2db；2使用mysql+mongodb。社区版只支持0和1，专业版支持2
-embed.db 1
+#embed.db 1
+embed.db 0
 
 ##服务器管理接口密钥
-http.admin.secret_key 123456
+http.admin.secret_key naifen360
 
 ##服务器API接口参数是否检查时间。当设置为false时，所有的请求会检查时间的有效性；当设置为true时，可以在http.admin.secret_key保持不变的情况下，使用固定的服务API签名
 ##nonce = "76616", timestamp = "1558350862502", sign = "b98f9b0717f59febccf1440067a7f50d9b31bdde"
@@ -50,7 +53,7 @@ http.admin.no_check_time true
 client.proto.secret_key 0x00,0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x78,0x79,0x7A,0x7B,0x7C,0x7D,0x7E,0x7F
 
 ##用来生产im token的私钥，只在服务器使用，客户端不用。正式使用时为了安全一定要修改这个值，切记切记
-token.key testim
+token.key naifen360
 
 ##token的过期时间，单位为毫秒，默认为无限期。如果需要设置无限期，客户端上一定需要加上token过期的处理。token过期的处理请参考文档的常见问题
 ##token.expire_time 2592000000
@@ -190,7 +193,7 @@ mongodb.data_expire_days 1096
 # Sensitive configuration
 #*********************************************************************
 ##文本敏感词过滤处理方法，0 发送失败；1 发送成功但消息被服务器直接丢弃；2 命中的敏感词被替换成***；3 记录并继续发送
-sensitive.filter.type 0
+sensitive.filter.type 2
 
 #*********************************************************************
 # Message forward configuration
diff --git a/distribution/src/main/resources/wildfirechat.conf b/distribution/src/main/resources/wildfirechat.conf
index 4a6542f1..23a501ff 100755
--- a/distribution/src/main/resources/wildfirechat.conf
+++ b/distribution/src/main/resources/wildfirechat.conf
@@ -4,7 +4,9 @@
 #服务器的接入IP。给客户端提供是${server.ip}和${http_port}。
 #客户端会从${http_port}端口获取到长链接端口。这个地址一定要改成客户端可以访问到的IP地址
 # （如果您部署云服务器上或者具有独立公网出口的服务器上，请改为对应的公网IP；如果您部署在在内网环境下，在内网使用，这个地方改成内网地址）
-server.ip 0.0.0.0
+#server.ip im.naifen360.com
+#server.ip im.naifen360.com
+server.ip localhost
 
 ##原生客户端长链接端口
 port 1883
@@ -28,10 +30,11 @@ host 0.0.0.0
 local_port 80
 
 ##是否使用内置DB。0使用mysql；1使用h2db；2使用mysql+mongodb。社区版只支持0和1，专业版支持2
-embed.db 1
+#embed.db 1
+embed.db 0
 
 ##服务器管理接口密钥
-http.admin.secret_key 123456
+http.admin.secret_key naifen360
 
 ##服务器API接口参数是否检查时间。当设置为false时，所有的请求会检查时间的有效性；当设置为true时，可以在http.admin.secret_key保持不变的情况下，使用固定的服务API签名
 ##nonce = "76616", timestamp = "1558350862502", sign = "b98f9b0717f59febccf1440067a7f50d9b31bdde"
@@ -41,7 +44,7 @@ http.admin.no_check_time false
 client.proto.secret_key 0x00,0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x78,0x79,0x7A,0x7B,0x7C,0x7D,0x7E,0x7F
 
 ##用来生产im token的私钥，只在服务器使用，客户端不用。正式使用时为了安全一定要修改这个值，切记切记
-token.key testim
+token.key naifen360
 
 ##token的过期时间，单位为毫秒，默认为无限期。如果需要设置无限期，客户端上一定需要加上token过期的处理。token过期的处理请参考文档的常见问题
 ##token.expire_time 2592000000
@@ -194,7 +197,7 @@ mongodb.data_expire_days 1096
 # Sensitive configuration
 #*********************************************************************
 ##文本敏感词过滤处理方法，0 发送失败；1 发送成功但消息被服务器直接丢弃；2 命中的敏感词被替换成***
-sensitive.filter.type 0
+sensitive.filter.type 2
 
 #*********************************************************************
 # Message forward configuration
diff --git a/pom.xml b/pom.xml
index c970fa5a..7d659cbd 100755
--- a/pom.xml
+++ b/pom.xml
@@ -90,6 +90,10 @@
                                 </goals>
                             </execution>
                         </executions>
+                        <configuration>  
+                          <source>1.8</source>  
+                          <target>1.8</target>  
+                        </configuration>
                     </plugin>
 
                     <plugin>
