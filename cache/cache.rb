#!/usr/bin/env ruby -w
require 'mini_cache'

# TODO: Import NodeJS Crypto and use it to generate SHA from HTML (the hash will be used as key, and the value will be the pdf binary)

$store = MiniCache::Store.new

def save(key,value)
	$store.set(key, value)
end

def retrieve(key)
	return $store.get(key)
end
