# -*- coding: utf-8 -*-
require 'spec_helper'

describe DXRubySDL::Image, '画像を表すクラス' do
  describe '.new' do
    context '幅と高さを指定した場合' do
      subject { DXRubySDL::Image.new(640, 480) }

      its(:width) { should eq(640) }
      its(:height) { should eq(480) }
    end
  end

  describe '#line' do
    let(:image) { DXRubySDL::Image.new(640, 480) }

    it '呼び出すことができる' do
      image.line(0, 0, 100, 100, [255, 255, 255])
    end
  end
end