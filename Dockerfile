FROM python:3.10-slim

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "src.api_app_titanic:app", "--host", "0.0.0.0", "--port", "8091"]
