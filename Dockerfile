FROM python:3.8-alpine as base
FROM base as builder
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY create.py /create.py
RUN python create.py

FROM base
# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local
COPY src /app
WORKDIR /app

# update PATH environment variable
ENV PATH=/home/app/.local/bin:$PATH

CMD ["/bin/sh"]