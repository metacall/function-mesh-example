#!/usr/bin/env ruby -w
require 'mini_cache'

store = MiniCache::Store.new

store.set('video', 'random123')

puts(store.get('video'))