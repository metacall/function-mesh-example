#!/usr/bin/env python3

from metacall import metacall_load_from_file, metacall

metacall_load_from_file('rb', ['cache/cache.rb'])
metacall_load_from_file('cs', ['image/Image.cs'])
metacall_load_from_file('node', ['video/video.js'])

def index():
	return metacall('video', 'hello') + metacall('cache', ' ') + metacall('GenerateImage', 'world')
