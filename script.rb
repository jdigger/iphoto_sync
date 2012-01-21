#!/usr/local/bin/macruby

require 'rubygems'
require "sqlite3"

framework 'Foundation'
framework 'ScriptingBridge'

iphoto = SBApplication.applicationWithBundleIdentifier("com.apple.iphoto")
load_bridge_support_file 'iPhoto.bridgesupport'

#(iphoto.methods(true, true) - Object.new.methods(true, true)).sort

photosAlbum = iphoto.photoLibraryAlbum

#db = SQLite3::Database.new('/Users/jmoore/Pictures/Jim\'s iPhoto Library/Database/Faces.db')