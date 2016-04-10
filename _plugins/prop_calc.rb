module Jekyll
  class PropCalcTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end
    def render(context)
      return unless context.registers.key? :page
      page_date = context.registers[:page]['date']
      exif = context.environments[0]['site']['data']['exif'][page_date.strftime('%Y')][page_date.strftime('%m')][page_date.strftime('%Y-%m-%d')]
      (exif['ImageHeight'].to_f / exif['ImageWidth'].to_f * 100).to_s + '%'
    end
  end
end

Liquid::Template.register_tag('prop_calc', Jekyll::PropCalcTag)
