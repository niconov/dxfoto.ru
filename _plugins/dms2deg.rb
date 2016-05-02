module Jekyll
  # filter to convert EXIF geo coordinates (presented as D deg M' S" H)
  # to decimal degrees
  module Dms2DegFilter
    def dms2deg(input)
      hh = { 'N': 1, 'E': 1, 'S': -1, 'W': -1 }
      d, _, m, s, h = input.split(' ')
      d, m, s = [d, m, s].map(&:to_f)
      (d + m / 60 + s / 3600) * hh[h.to_sym]
    end
  end
end

Liquid::Template.register_filter(Jekyll::Dms2DegFilter)
