# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AWSProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
# pod 'AWSCore', '~> 2.9.10'

  # Pods for AWSProject
  pod 'AWSMobileClient', '~> 2.12.1'      # Required dependency
   pod 'AWSAuthUI', '~> 2.12.1'            # Optional dependency required to use drop-in UI
   pod 'AWSUserPoolsSignIn', '~> 2.12.1' 

  
  pod 'Amplify'
  pod 'AmplifyPlugins/AWSAPIPlugin'
  
  target 'AWSProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AWSProjectUITests' do
    # Pods for testing
  end

end
