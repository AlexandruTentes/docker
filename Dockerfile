FROM 		ubuntu:18.04

RUN 		apt-get update && apt-get install -y openjdk-8-jdk && rm -rf /var/lib/apt/lists/*

USER 		ftb:ftb
WORKDIR 	/home/ftb/

ADD 		--chown=ftb:ftb https://api.modpacks.ch/public/modpack/36/147/server/linux /home/ftb/ftb_modpack_installer
RUN		chmod +x ftb_modpack_installer \
		&& echo y | ./ftb_modpack_installer 36 
RUN		chmod +x start.sh \
		&& echo y | ./start.sh \
		&& echo 'eula=true' > eula.txt

EXPOSE 		25565

CMD 		echo y | ./start.sh 