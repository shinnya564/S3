unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws__key_id: ENV['ACCESS_KEY'],
      aws_secret_access_key: ENV['SECRET_KEY'],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'test111111222222'
    config.cache_storage = :fog
  end
end