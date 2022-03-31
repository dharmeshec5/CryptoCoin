
Pod::Spec.new do |spec|


  spec.name         = "CryptoCoin"
  spec.version      = "1.0.0"
  spec.summary      = "Crypto coin screen design."


  spec.description  =  <<-DESC
This CocoaPods library for cryto coin information.
                   DESC

  spec.homepage     = "https://github.com/dharmeshec5/CryptoCoin"

  spec.license      =  { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "Dharmesh Patel" => "dharmeshec5@gmail.com" }

  spec.ios.deployment_target = "12.0"
 # spec.osx.deployment_target = "11.0"
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/dharmeshec5/CryptoCoin.git", :tag => "#{spec.version}" }


  spec.source_files  = "CryptoCoin/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

end
