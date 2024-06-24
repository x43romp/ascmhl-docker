FROM python
RUN pip3 install --upgrade ascmhl
ENTRYPOINT [ "ascmhl" ]