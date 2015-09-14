Pod::Spec.new do |s|
  s.name             = "Holarchy"
  s.version          = "0.0.1"
  s.summary          = "A subclass of UIScrollView that provides painless building of forms etc."

  s.description      = %{
        A subclass of UIScrollView that provides painless building of forms etc.
}


  s.homepage         = "https://github.com/rimsan/Holarchy"
  s.license          = 'MIT'
  s.author           = { "Roman Petryshen" => "roman@travelbird.com" }
  s.source           = { :git => "https://github.com/rimsan/Holarchy.git", :tag => s.version.to_s }


  s.social_media_url = 'https://twitter.com/RomanPetryshen'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Holarchy/*'


  s.frameworks = 'UIKit'
end
