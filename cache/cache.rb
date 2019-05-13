#!/usr/bin/env ruby -w
require 'mini_cache'

$store = MiniCache::Store.new

def save(key,value)
    $store.set(key, value)
end

def retrieve(key)
    return $store.get(key)
end
