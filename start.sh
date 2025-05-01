#!/bin/bash
set -e  # Fail on first error
echo "Starting Streamlit..."
streamlit run app/ui.py --server.port 8501 --server.address 0.0.0.0

sleep 5

echo "Starting FastAPI..."
uvicorn app.main:app --host 0.0.0.0 --port 8000 &