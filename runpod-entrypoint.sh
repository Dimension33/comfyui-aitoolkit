#!/bin/bash

# Start supervisord
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

# Setup AI-toolkit environment and run Gradio UI
source /workspace/environments/python/aitoolkit/bin/activate
huggingface-cli login

# Start AI-toolkit Gradio UI in the background
nohup /workspace/ai-toolkit/run_aitoolkit_ui.sh > /workspace/logs/aitoolkit_ui.log 2>&1 &

# Start Jupyter Notebook
jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --notebook-dir=/workspace/notebooks

# Keep the container running
tail -f /dev/null