# -*- coding: utf-8 -*-

module DXRubySDL
  class Font
    attr_reader :size
    attr_reader :_ttf

    def initialize(size, fontname = '', hash = {})
      @size = size

      if !SDL::TTF.init?
        SDL::TTF.init
      end
      if !(path = FONTS[fontname.downcase])
        path = FONTS.first.last
      end
      @_ttf = SDL::TTF.open(path, size)
    end

    private

    if /darwin/ =~ RUBY_PLATFORM
      FONTS = {
        'osaka' => '/Library/Fonts/osaka.ttf',
        'IPA ゴシック' => '/Library/Fonts/ipag.ttf',
        'IPA Pゴシック' => '/Library/Fonts/ipagp.ttf',
      }
    elsif /linux/ =~ RUBY_PLATFORM
      FONTS = {
        'IPA ゴシック' => '/usr/share/fonts/opentype/ipafont/ipag.ttf',
        'IPA Pゴシック' => '/usr/share/fonts/opentype/ipafont/ipagp.ttf',
      }
    end
  end
end