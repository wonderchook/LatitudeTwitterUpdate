require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'twitter'

url = URI.parse('http://www.google.com')
    latloc = Net::HTTP.start(url.host, url.port) {|http|
      http.get('/latitude/apps/badge/api?user=latitudeuserinfo&type=json')
    }
data = latloc.body
json = JSON.parse(data)
feature = json['features'][0]['geometry']['coordinates']
latitude = feature[1]
longitude = feature[0]
where =  feature[1].to_s << ' ' << feature[0].to_s
httpauth = Twitter::HTTPAuth.new('username', 'password')
base = Twitter::Base.new(httpauth)
base.update_profile('location=' + where)




