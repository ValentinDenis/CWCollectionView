Pod::Spec.new do |s|
  s.name             = 'CWCollectionView'
  s.version          = '0.4.0'
  s.summary          = 'Easily create collection views with a desired number of columns'
 
  s.description      = <<-DESC
UICollectionView subclass to easily setup a collection view with a given number of columns
                       DESC
 
  s.homepage         = 'https://github.com/ValentinDenis/CWCollectionView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Valentin Denis' => 'valentindenis80@gmail.com' }
  s.source           = { :git => 'https://github.com/ValentinDenis/CWCollectionView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'CWCollectionView/CWCollectionView/CWCollectionView.swift'
  s.swift_version = '4.1'
end