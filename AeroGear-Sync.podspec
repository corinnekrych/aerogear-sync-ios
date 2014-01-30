Pod::Spec.new do |s|
  s.name         = "AeroGear-Sync"
  s.version      = "0.1.0"
  s.summary      = "AeroGear Sync Client Registration SDK."
  s.homepage     = "https://github.com/aerogear/aerogear-sync-ios"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Red Hat, Inc."
  s.source       = { :git => 'https://github.com/aerogear/aerogear-sync-ios.git', :tag => '0.1.0' }
  s.platform     = :ios, 5.0
  s.source_files = 'push-sdk/**/*.{h,m}'
  s.public_header_files = 'sync-sdk/AeroGearPush.h'
  s.requires_arc = true
  s.dependency 'AFNetworking', '1.3.3'
end
