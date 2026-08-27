#
#  Be sure to run `pod spec lint EpCanDribenk.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "EpCanDribenk"
  spec.version      = "1.0.4"
  spec.summary      = "A short description of EpCanDribenk."
  spec.homepage     = "https://github.com/girhubuser/EpCanDribenk.git"
  spec.license      = "MIT"
  spec.author       = { "ECD" => "hyzhaocan@gmail.com" }
  spec.platform     = :ios, "15.0"
  spec.source       = { :git => "https://github.com/girhubuser/EpCanDribenk.git", :tag => spec.version.to_s }
  spec.source_files  = "Sources/EpCanDribenk/**/*.swift"
end
