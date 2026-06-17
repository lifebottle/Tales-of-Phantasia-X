#!/bin/bash
if command -v uv &>/dev/null
then
    uv venv .venv
    uv sync
else
    python3 -m venv .\venv
    source .venv/bin/activate
    pip3 install -r requirements.txt
fi
