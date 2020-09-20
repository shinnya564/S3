# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 画像名に日本語が使えるようにする
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

# 保存先の分岐
CarrierWave.configure do |config|
  # 本番環境はS3に保存
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'test111111222222'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test111111222222'
    # iam_profile
    config.fog_credentials = {
      provider: 'AWS',
      # 環境変数で管理する場合
      aws_access_key_id: ENV['ACCESS_KEY'],
      aws_secret_access_key: ENV['SECRET_KEY'],
      region: 'ap-northeast-1' #東京リージョン
    }
    # キャッシュをS3に保存
    # config.cache_storage = :fog
  else
    # 開発環境はlocalに保存
    config.storage :file
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end
end
