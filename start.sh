#!/bin/bash
set -e  # Exit on first error

echo "Starting Streamlit on port 8000..."
# Start Streamlit in the background on port 8000 (so Render exposes it)
streamlit run app/ui.py --server.port 8000 --server.address 0.0.0.0 &

echo "Starting FastAPI on port 8001..."
# Run FastAPI on internal port 8001
uvicorn app.main:app --host 0.0.0.0 --port 8001