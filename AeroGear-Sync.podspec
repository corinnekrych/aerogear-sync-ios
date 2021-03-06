Pod::Spec.new do |s|
  s.name         = "AeroGear-Sync"
  s.version      = "0.1.0"
  s.summary      = "AeroGear Sync Client Registration SDK."
  s.homepage     = "https://github.com/corinnekrych/aerogear-sync-ios"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Red Hat, Inc."
  s.source       = { :git => 'https://github.com/corinnekrych/aerogear-sync-ios.git' }
  s.platform     = :ios, 5.0
  s.source_files = 'sync-sdk/**/*.{h,m}'
  s.public_header_files = 'sync-sdk/AeroGearSync.h', 'sync-sdk/AGSyncPipe.h', 'sync-sdk/AGSync.h', 'sync-sdk/AGSyncMetaData.h', 'sync-sdk/AGSyncPipeConfiguration.h'
  s.requires_arc = true
end
