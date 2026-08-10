FROM langflowai/langflow:1.11.2

COPY Simple-Agent.json /app/flows/Simple-Agent.json

ENV LANGFLOW_LOAD_FLOWS_PATH=/app/flows

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7861"]
