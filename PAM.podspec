Pod::Spec.new do |s|
  s.name         = "PAM"
  s.version      = "0.0.13"
  s.summary      = "A protable implementation of Photographic Affect Meter (PAM)"
  s.homepage     = "https://github.com/Keymochi/PAM"
  s.license      = { :type => "MIT" }

  s.author             = { "Huai-Che Lu" => "hc.acsalu@gmail.com" }
  s.ios.deployment_target     = "10.0"

  s.source       = { :git => "https://github.com/Keymochi/PAM.git", :tag => "#{s.version}" }

  s.source_files  = "PAM/*.swift"

  s.ios.resource_bundle = { 'ResourceBundle' => 'PAM/Images/**/*.jpg' }
end
