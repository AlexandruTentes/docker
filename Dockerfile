FROM 		ubuntu:18.04

USER 		ftb:ftb
WORKDIR 	/home/ftb/

RUN 		apt-get update && apt-get install -y openjdk-8-jdk && rm -rf /var/lib/apt/lists/*
ADD 		https://api.modpacks.ch/public/modpack/36/147/server/linux /home/ftb/
RUN		mv linux ftb_modpack_installer \
		&& chmod 755 ftb_modpack_installer \
		&& echo y | ./ftb_modpack_installer 36 \
		&& chmod 755 start.sh \
		&& echo y | ./start.sh \
		&& echo 'eula=true' > eula.txt

EXPOSE 		25565

CMD 		echo y | ./start.sh 