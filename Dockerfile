FROM openjdk:11
#把文件夹 fonts 和jar包拷贝到服务器后面指定的路径中去
ADD application-test.yml /tmp/application-test.yml
ADD application-prod.yml /tmp/application-prod.yml
ADD mrstage-base.jar /tmp/app.jar
#暴露端口号
EXPOSE 8080
#容器启动时执行的指令，有多个只会执行最后一个
CMD ["--spring.profiles.active=test"]
#容器运行时执行的指令，有多个都会执行
ENTRYPOINT ["java", "-jar", "-Duser.timezone=GMT+08", "/tmp/app.jar"]