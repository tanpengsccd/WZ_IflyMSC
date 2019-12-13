Pod::Spec.new do |s|

  s.name         = "WZIflyMSC"
  s.version      = "1180"
  s.summary      = "讯飞语音"
  s.description  = <<-DESC
                    科大讯飞 (仅)语音声纹 SDK
                   DESC

  s.homepage     = "https://www.xfyun.cn/sdk/dispatcher"
  s.license      = "MIT"
  s.author           = { 'tanpengsccd' => 'tanpengcd@gmail.com' }
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/tanpengsccd/WZIflyMSC.git", :tag => "#{s.version}" }

  s.vendored_frameworks = 'Source/iflyMSC.framework'

  s.xcconfig            = { "LIBRARY_SEARCH_PATHS" => "\"$(PODS_ROOT)/iflyMSCKit/**\"" }

  s.frameworks = 'AVFoundation','SystemConfiguration','Foundation','CoreTelephony','AudioToolbox','UIKit','CoreLocation','Contacts','AddressBook','QuartzCore','CoreGraphics'
  s.libraries = 'z','c++','icucore'

  s.requires_arc = false

  s.prepare_command     = <<-EOF
  rm -rf  Source/iflyMSC.framework/Modules 
  mkdir Source/iflyMSC.framework/Modules
  touch Source/iflyMSC.framework/Modules/module.modulemap
  cat <<-EOF > Source/iflyMSC.framework/Modules/module.modulemap
  framework module iflyMSC {
    header "IFlyVoiceWakeuperDelegate.h"
    header "IFlyAudioSession.h"
    header "IFlyContact.h"
    header "IFlyDataUploader.h"
    header "IFlyDebugLog.h"
    header "IFlyIdentityResult.h"
    header "IFlyIdentityVerifier.h"
    header "IFlyIdentityVerifierDelegate.h"
    header "IFlyISVDelegate.h"
    header "IFlyISVRecognizer.h"
    header "IFlyMSC.h"
    header "IFlyPcmRecorder.h"
    header "IFlyRecognizerView.h"
    header "IFlyRecognizerViewDelegate.h"
    header "IFlyResourceUtil.h"
    header "IFlySetting.h"
    header "IFlySpeechConstant.h"
    header "IFlySpeechError.h"
    header "IFlySpeechEvaluator.h"
    header "IFlySpeechEvaluatorDelegate.h"
    header "IFlySpeechEvent.h"
    header "IFlySpeechRecognizer.h"
    header "IFlySpeechRecognizerDelegate.h"
    header "IFlySpeechSynthesizer.h"
    header "IFlySpeechSynthesizerDelegate.h"
    header "IFlySpeechUnderstander.h"
    header "IFlySpeechUtility.h"
    header "IFlyTextUnderstander.h"
    header "IFlyUserWords.h"
    header "IFlyVerifierUtil.h"
    header "IFlyVoiceWakeuper.h"

      export *

      link "z"
      link "c++"
  }
  \EOF
  EOF
end