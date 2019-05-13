#!/usr/bin/env ruby -w
require 'mini_cache'

store = MiniCache::Store.new

def store(key,value)
    store.set(key, value)
end

def retrieve(key)
    return puts(store.get(key))
end

store "video","123"
retrieve "video"