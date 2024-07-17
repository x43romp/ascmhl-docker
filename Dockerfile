FROM ubuntu AS mhl
RUN apt update;
RUN apt install git make libssl-dev libxml2-dev gcc -y;
RUN git clone https://github.com/pomfort/mhl-tool.git /root/mhl-tool
WORKDIR /root/mhl-tool/dev_envs/Ubuntu_12.04_x64
RUN make release
RUN cp /root/mhl-tool/bin/Ubuntu_12.04_x64/Release/mhl /usr/bin

FROM ubuntu AS other
COPY --from=mhl /root/mhl-tool/bin/Ubuntu_12.04_x64/Release/mhl /usr/bin
RUN chmod +x /usr/bin/mhl
RUN apt update; apt install libxml2 -y; 
RUN DEBIAN_FRONTEND=noninteractive apt install python3 python3-pip -y;
RUN apt clean;
RUN pip3 install --break-system-packages ascmhl;

COPY ignore.txt /data/ignore.txt
COPY mhl-convert.txt /data/mhl-convert.txt
RUN cat /data/mhl-convert.txt >> ~/.bashrc

ENTRYPOINT [ "/bin/bash" ]


# FROM python
# COPY --from=mhl  /root/mhl-tool/bin/Ubuntu_12.04_x64/Release/mhl /usr/bin
# RUN pip3 install --upgrade ascmhl
# ENTRYPOINT [ "ascmhl" ]

