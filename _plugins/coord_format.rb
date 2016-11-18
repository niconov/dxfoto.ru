module Jekyll
  # filter to format EXIF GPS coordinates for Google Maps
  module CoordFormatFilter
    def coord_format(input)
      input.gsub(' deg', '°').tr('"', '″').tr("'", '′')
    end
  end
end

Liquid::Template.register_filter(Jekyll::CoordFormatFilter)
