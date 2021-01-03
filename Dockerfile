FROM python:3.7-alpine
WORKDIR /src
#ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers curl bash
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY ./src /src
EXPOSE 5000
CMD ["python", "main.py"]
#CMD tail -f /dev/null
