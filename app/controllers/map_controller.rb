# -*- coding: utf-8 -*-
class MapController < ApplicationController
def index
  @map = GMap.new("map_div")

  @map.control_init(:large_map => true, :map_type => true)

  @map.center_zoom_init([35.647401,139.716911],6)
end
def find
  lat = params[:lat]
  lon = params[:lon]
  area = Area.find(:first, :contain => "ST_Point(#{lon}, #{lat})")
  if area.nil?
    @message = "Area not found"
  else

    poly = area.wgs_geom[0]
    envelope = poly.envelope

	
    @id = area.gid
    @name = area.名称
    @map = Variable.new("map")
    @polygon = GPolygon.from_georuby(poly,"#000000",0,0.0,"#ff0000",0.6)
    @center = GLatLng.from_georuby(envelope.center)
    @zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))

  end
end
end
