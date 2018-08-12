# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ExportContact(VCard)' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

    pod 'SwiftyButton'
    pod 'paper-onboarding'
    pod 'RevealingSplashView'

    #IB Designables hatası çözümü
    post_install do |installer|
        installer.pods_project.build_configurations.each do |config|
            config.build_settings.delete('CODE_SIGNING_ALLOWED')
            config.build_settings.delete('CODE_SIGNING_REQUIRED')
        end
    end
end
