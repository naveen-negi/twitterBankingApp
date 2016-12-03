class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    p  auth.uid
    p  auth.credentials.token
    p  auth.info.name
    p  auth.info.nickname
    p  auth.info.urls[:Twitter]


    find_or_create_by(uid: auth.uid, provider: auth.provider, name: auth.info.name,
    oauth_token: auth.credentials.token,nickname:auth.info.nickname,
     url: auth.info.urls[:Twitter])
  end
end
