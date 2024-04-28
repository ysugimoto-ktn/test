FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

WORKDIR /workspaces

#Install and setup poetry
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_HOME=/etc/poetry
ENV PATH=${POETRY_HOME}/bin:${PATH}
RUN curl -sSL https://install.python-poetry.org | python3 -
COPY . .
RUN poetry install --no-interaction

EXPOSE 8080

CMD ["streamlit", "run", "app/app.py", "--server.port", "8080"]