#!/usr/bin/env python

from pathlib import Path
import re

lines = Path.home().joinpath(".cache", "wal", "colors").read_text().splitlines()
data = Path.home().joinpath(".config", "dunst", "dunstrc").read_text()

data = re.sub(r'(\[urgency_low\][\s\S]*?background\s*=\s)(\".*\")', r'\1"{color}"'.format(color = lines[1]), data)
data = re.sub(r'(\[urgency_low\][\s\S]*?foreground\s*=\s)(\".*\")', r'\1"{color}"'.format(color = lines[-1]), data)

data = re.sub(r'(\[urgency_normal\][\s\S]*?background\s*=\s)(\".*\")', r'\1"{color}"'.format(color = lines[1]), data)
data = re.sub(r'(\[urgency_normal\][\s\S]*?foreground\s*=\s)(\".*\")', r'\1"{color}"'.format(color = lines[-1]), data)

data = re.sub(r'(\[urgency_critical\][\s\S]*?background\s*=\s)(\".*\")', r'\1"{color}"'.format(color = lines[0]), data)
data = re.sub(r'(\[urgency_critical\][\s\S]*?foreground\s*=\s)(\".*\")', r'\1"{color}"'.format(color = lines[-1]), data)

Path.home().joinpath(".config", "dunst", "dunstrc").write_text(data)
