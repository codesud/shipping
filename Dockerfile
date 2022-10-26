FROM        maven:3-openjdk-8
RUN         useradd -m roboshop 
USER        roboshop  
WORKDIR     /home/roboshop   
COPY        src/ src/ 
COPY        pom.xml . 
RUN         ls -ltr 
RUN         env && mvn package
RUN         ls -ltr
RUN         mv target/shipping-1.0.jar shipping.jar 
ENTRYPOINT [ "java", "-jar", "shipping.jar" ]