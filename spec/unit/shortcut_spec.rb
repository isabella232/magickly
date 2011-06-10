require 'spec_helper'

describe "Dragonfly shortcuts" do
  before do
    @image_path = File.join(File.dirname(__FILE__), '..', 'support', 'imagemagick.png')
    @image = Magickly.dragonfly.fetch_file(@image_path)
  end
  
  describe :brightness_contrast do
    it "should throw an error for no arguments" do
      expect { @image.brightness_contrast }.to raise_error
    end
    
    it "should throw an error for a empty string" do
      expect { @image.brightness_contrast('') }.to raise_error(ArgumentError)
    end
    
    it "should succeed for a valid argument" do
      @image.brightness_contrast('10x10')
    end
    
    it "should succeed for negative values" do
      @image.brightness_contrast('-80x-80')
    end
  end
  
  describe :color_palette do
    it "should return an array" do
      palette = @image.color_palette
      palette.should be_an Array
    end
    
    it "should have the default number of colors" do
      palette = @image.color_palette
      palette.length.should eq Magickly::DEFAULT_PALETTE_COLOR_COUNT
    end
    
    it "should have the specified number of colors" do
      num_colors = 4
      num_colors.should_not eq Magickly::DEFAULT_PALETTE_COLOR_COUNT
      
      palette = @image.color_palette(num_colors)
      palette.length.should eq num_colors
    end
  end
  
  describe :tilt_shift do
    it "should throw an error for no coefficient" do
      expect { @image.tilt_shift }.to raise_error
    end
    
    it "should throw an error for a empty string" do
      expect { @image.tilt_shift('') }.to raise_error(ArgumentError)
    end
    
    it "should succeed for a valid coefficient" do
      @image.tilt_shift('2,-1,0.5')
    end
  end
end
