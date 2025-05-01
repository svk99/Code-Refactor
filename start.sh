#!/bin/bash
set -e  # Fail on first error
echo "Starting FastAPI..."
uvicorn app.main:app --host 0.0.0.0 --port 8000 &

echo "Starting Streamlit..."
streamlit run app/ui.py --server.port 8501 --server.address 0.0.0.0


# # Start FastAPI (on port 8000) in the background
# uvicorn app.main:app --host 0.0.0.0 --port 8000 &

# # Start Streamlit (on port 8501)
# streamlit run app/ui.py --server.port 8501