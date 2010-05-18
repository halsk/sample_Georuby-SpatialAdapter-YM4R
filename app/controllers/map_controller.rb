# -*- coding: utf-8 -*-
class MapController < ApplicationController
def index
  @map = GMap.new("map_div")

  @map.control_init(:large_map => true, :map_type => true)

  @map.center_zoom_init([35.647401,139.716911],6)
end
def find
  if (params[:lat] and params[:lon])
    lat = params[:lat]
    lon = params[:lon]
    
    areas = Area.find(:all, :contain => "ST_Point(#{lon}, #{lat})")
  elsif (params[:code])
    areas = Area.find(:all, :conditions => ["行政コード in (?)", params[:code].split(",").map{|d| d.to_i}])
  else
    areas = nil
  end

  if areas.nil?
    @message = "Area not found"
  else
    @polygons = []
    @map = Variable.new("map")
    envelope = nil
	areas.each do |area|
      @id = area.gid
      @name = area.名称
      
      area.wgs_geom.each do |poly|
        envelope = envelope.nil? ? poly.envelope : envelope.extend(poly.envelope) 
      
        @polygons << GPolygon.from_georuby(poly,"#ff0000",2,0.8,"#ff0000",0.4)
      end
    end
    @center = GLatLng.from_georuby(envelope.center)
    @zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))

  end
end
end
