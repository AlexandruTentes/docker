FROM 		ubuntu

MAINTAINER 	aly_t99@yahoo.com

RUN 		apt-get update \
		&& apt-get install -y wget \
		&& apt-get install -y openjdk-8-jdk \
		&& rm -rf /var/lib/apt/lists/* \
		&& mkdir /home/ftb \
		&& wget https://api.modpacks.ch/public/modpack/36/147/server/linux -P /home/ftb/ \
		&& cd home/ftb/ \
		&& mv linux ftb_modpack_installer \
		&& chmod 755 ftb_modpack_installer \
		&& echo y | ./ftb_modpack_installer 36 \
		&& chmod 755 start.sh \
		&& echo y | ./start.sh \
		&& echo 'eula=true' > eula.txt

EXPOSE 		25565

WORKDIR 	/home/ftb

CMD 		echo y | ./start.sh 