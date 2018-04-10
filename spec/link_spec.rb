require 'link'

describe Link do


  describe '#self.all' do
    it 'Should return the hardcoded bookmark array' do
      expect(Link.all).to eq ["http://makersacademy.com", "http://google.com", "http://destroyallsoftware.com"]
    end
  end

end
