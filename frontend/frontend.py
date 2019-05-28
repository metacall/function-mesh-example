#!/usr/bin/env python3

from metacall import metacall_load_from_file, metacall

# Load scripts from other languages
metacall_load_from_file('rb', ['cache/cache.rb'])
metacall_load_from_file('cs', ['pdf/Pdf.cs'])
metacall_load_from_file('node', ['react/react.js'])

# Load index html file
basepath = path.dirname(path.abspath(__file__))

with open(path.join(basepath, 'index.html'), 'r') as f:
	template = f.read()

# The workflow must be the following
#	A) Request to index is received
#		- Load return index.html previously loaded (https://github.com/metacall/examples/blob/master/time-app-web/index.py)
#	B) Request to convert is received (from AJAX in index.html similarly to https://github.com/metacall/examples/blob/master/time-app-web/index.html)
#		- First of all, call to the cache to check if this html code has been already generated as pdf
#			- If it is loaded, return it, otherwise continue
#		- Call to C# pdf geneartion in order to obtain the pdf binary
#		- Store the pdf into the cache using html as a key (this html will be hashed inside ruby)
#		- Return the pdf in binary format

# TODO: Think about how to use react server side rendering (maybe we can use it to allow converting react to html and then to pdf)

def index():
	return template

def convert(html):
	return 0
