FROM python:3.10-slim-buster

WORKDIR /var/www/

RUN mkdir namizun

COPY . ./namizun

WORKDIR /var/www/namizun

RUN pip3 install virtualenv

RUN useradd -m foo
RUN chown -R foo:foo /var/www/namizun
RUN chown -R foo:foo /home/foo
USER foo

RUN python3 -m venv venv
#RUN venv/bin/pip install -r requirements.txt
RUN /var/www/namizun/venv/bin/pip3 install wheel
RUN /var/www/namizun/venv/bin/pip3 install namizun_core/ namizun_menu/

CMD [ "python3", "uploader.py"]