Pod::Spec.new do |s|
  s.name             = "Pythonic"
  s.version          = "1.0.0"
  s.summary          = "Pythonic tool-belt for iOS – a Swift implementation of selected parts of Python standard library."
  s.homepage         = "https://github.com/danysousa/Pythonic.iOS.git"
  s.license          = { :type => 'MIT' }
  s.author           = { "Pythonic" => "Pythonic@yopmail.com" }
  s.source           = { :git => "https://github.com/danysousa/Pythonic.iOS.git", :tag => "1.0.0"}

  s.source_files  = 'src/*.swift'

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.module_name = 'Pythonic'
end
