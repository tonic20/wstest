require 'spec_helper'

describe AppConfig do
  describe 'values with type' do
    let(:config_string)  { create :app_config }
    let(:config_integer) { create :app_config_integer }
    let(:config_float) { create :app_config_float }
    let(:config_boolean) { create :app_config_boolean, value: 'true' }

    it { expect(config_string.value_with_type).to be_a(String) }
    it { expect(config_integer.value_with_type).to be_a(Integer) }
    it { expect(config_float.value_with_type).to be_a(Float) }
    it { expect(config_boolean.value_with_type).to be_a(TrueClass) }
  end

  describe 'Read settings' do
    let(:config)  { create :app_config }

    it { expect(AppConfig[:random_nonexistent_name]).to be_nil }
    it { expect(AppConfig[config.name]).to eq config.value }
  end

  describe 'Write settings' do
    before :each do
      Rails.cache.clear
    end

    it 'save string setting' do
      expect(AppConfig[:test]).to be_nil
      AppConfig[:test] = 'test'
      expect(AppConfig[:test]).to eq 'test'
    end

    it 'save integer setting' do
      AppConfig[:test] = 100
      expect(AppConfig[:test]).to eq 100
    end

    it 'save float setting' do
      AppConfig[:test] = 100.99
      expect(AppConfig[:test]).to eq 100.99
    end

    it 'save boolean setting' do
      AppConfig[:test] = true
      expect(AppConfig[:test]).to eq true
    end
  end
end