#!/bin/bash
set -e   # exit on first error

echo "Starting FastAPI…"
uvicorn app.main:app --host 0.0.0.0 --port 8000 &   # background it
API_PID=$!

# optional: wait until FastAPI is ready
sleep 3

echo "Starting Streamlit…"
streamlit run app/ui.py --server.port 8501 --server.address 0.0.0.0