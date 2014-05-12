class AppConfig < ActiveRecord::Base
  enum value_type: [:string, :integer, :float, :boolean]

  validates :name, presence: true
  validates :value, presence: true
  validates :value_type, presence: true

  def value_with_type
    case value_type
    when 'integer'
      value.to_i
    when 'float'
      value.to_f
    when 'boolean'
      value == 'true'
    else
      value
    end
  end

  def self.[](name)
    Rails.cache.fetch "config.#{name}" do
      config = find_by_name(name.to_s)
      config.value_with_type if config
    end
  end

  def self.[]=(name, value)
    config = find_or_create_by(name: name.to_s)
    config.value = value.to_s
    config.value_type = detect_type(value)
    Rails.cache.write "config.#{name}", value
    config.save
  end

  def self.detect_type(value)
    case value
      when Fixnum
        :integer
      when Float
        :float
      when TrueClass, FalseClass
        :boolean
      else
        :string
    end
  end
end
