Pod::Spec.new do |spec|
  spec.name         = 'Quotes'
  spec.version      = '0.1.0'
  spec.homepage	    =  'https://gitlab.com/virtusaiostraining/t3training/-/tree/assignment8-dambar'
  spec.license      =  'MIT'
  spec.authors      = { 'Dambar Bista' => 'dambarbista.db@gmail.com' }
  spec.summary      = 'To layout dashboard UI and business login'
  spec.source	      =  { :git => 'https://dummyurl.com/Profile.git', :tag => 'v0. 1.0' }
  spec.source_files = '**/*.{swift}'
  spec.ios.deployment_target = '13.0'
  spec.resources = '**/*.{xib,png,json,xcassets}'
  spec.dependency 'SnapKit', '~> 5.0.0'
  spec.dependency "Profile"
  spec.dependency "PopUp"
  spec.dependency "TableViewReuseableCell"

end

