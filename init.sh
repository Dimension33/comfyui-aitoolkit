#!/bin/bash

# Start supervisord
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

# Setup AI-toolkit environment and run Gradio UI
source /workspace/environments/python/aitoolkit/bin/activate
huggingface-cli login

# Start AI-toolkit Gradio UI in the background
nohup /workspace/ai-toolkit/run_aitoolkit_ui.sh > /workspace/logs/aitoolkit_ui.log 2>&1 &

# Keep the script running
tail -f /dev/null