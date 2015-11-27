require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://peganda.com'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'yearly', :priority => 0.9
  add '/#features', :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks