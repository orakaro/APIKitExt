Pod::Spec.new do |s|
  s.name             = 'APIKitExt'
  s.version          = '0.0.1'
  s.summary          = 'Useful extensions for APIKit'
  s.description      = <<-DESC
APIKitExt is a set of useful extension to work with APIKit and libraries such as ObjectMapper etc
                       DESC

  s.homepage         = 'https://github.com/DTVD/APIKitExt'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Orakaro' => 'nhatminh_179@hotmail.com' }
  s.source           = { :git => 'https://github.com/DTVD/APIKitExt.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.default_subspec  = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/Classes/Core/*.swift"
    ss.framework     = "Foundation"
    ss.dependency "APIKit", '3.1.1'
  end

  s.subspec "ObjectMapper" do |ss|
    ss.source_files  = "Sources/Classes/ObjectMapper/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "ObjectMapper", '2.2.2'
  end

  s.subspec "Himotoki" do |ss|
    ss.source_files  = "Sources/Classes/Himotoki/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "Himotoki", '3.0.0'
  end

  s.subspec "Argo" do |ss|
    ss.source_files  = "Sources/Classes/Argo/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "Argo", '4.1.1'
  end

  s.subspec "SwiftyJSON" do |ss|
    ss.source_files  = "Sources/Classes/SwiftyJSON/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "SwiftyJSON", '3.1.4'
  end

  s.subspec "ModelMapper" do |ss|
    ss.source_files  = "Sources/Classes/ModelMapper/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "ModelMapper", '6.0.0'
  end

  s.subspec "JASON" do |ss|
    ss.source_files  = "Sources/Classes/JASON/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "JASON", '3.1'
  end

  s.subspec "Unbox" do |ss|
    ss.source_files  = "Sources/Classes/Unbox/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "Unbox", '2.3.0'
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "Sources/Classes/RxSwift/*.swift"
    ss.dependency "APIKitExt/Core"
    ss.dependency "RxSwift", '3.0.1'
  end

end
