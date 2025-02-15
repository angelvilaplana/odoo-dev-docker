FROM postgres:15

ARG POSTGRES_USER_ID=1000

RUN usermod  -u "$POSTGRES_USER_ID" postgres && \ 
    groupmod -g "$POSTGRES_USER_ID" postgres
