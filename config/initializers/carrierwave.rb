unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA6CFPZC3ZAF5FXT55',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'test111111222222'
    config.cache_storage = :fog
  end
end