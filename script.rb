#!/usr/local/bin/macruby

REFRESH_ALL_DATA = false

framework 'Foundation'
framework 'ScriptingBridge'

iphoto = SBApplication.applicationWithBundleIdentifier("com.apple.iphoto")
load_bridge_support_file 'iPhoto.bridgesupport'

photosAlbum = iphoto.photoLibraryAlbum

#(iphoto.methods(true, true) - Object.new.methods(true, true)).sort
#photosAlbum.photos[3926].properties

#require "sqlite3"
#db = SQLite3::Database.new('/Users/jmoore/Pictures/Jim\'s iPhoto Library/Database/Faces.db')

require 'rubygems'
require 'mongo'

db = Mongo::Connection.new.db("iphoto")
photo_data = db["photo_data"]

if (REFRESH_ALL_DATA) then
  photosAlbum.photos.each do |photo|
    doc = { iphoto_id: photo.id, name: String.new(photo.name), longitude: photo.longitude, latitude: photo.latitude, altitude: photo.altitude,
      height: photo.height, width: photo.width, comment: String.new(photo.comment), date: photo.date.utc, imagePath: String.new(photo.imagePath), }
    photo_data.insert(doc)
  end
end
