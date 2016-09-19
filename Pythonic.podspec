Pod::Spec.new do |s|
  s.name             = "Pythonic"
  s.version          = "1.0.0"
  s.summary          = "Pythonic.swift is a Swift library implementating selected parts of Python's standard library and making them available to your Swift code."
  s.homepage         = "https://github.com/practicalswift/Pythonic.swift"
  s.license          = { :type => 'MIT' }
  s.author           = { "Pythonic" => "Pythonic@yopmail.com" }
  s.source           = { :git => "https://github.com/danysousa/Pythonic.swift.git", :tag => "1.0.0"}

  s.source_files  = 'src/*.swift'

  s.platform = :ios

  s.frameworks = 'Foundation', 'Darwin'
  s.module_name = 'Pythonic'
end
