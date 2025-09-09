FROM python:3-slim

ARG HOST=0.0.0.0
ARG PORT=8015
ENV HOST=${HOST}
ENV PORT=${PORT}
ENV PATH="/usr/local/bin:${PATH}"
RUN pip install uv \
    && uv pip install --system container-manager-mcp[all]

ENTRYPOINT exec container-manager-mcp --transport "http" --host "${HOST}" --port "${PORT}"
