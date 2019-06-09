# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
  pod 'Moya', '~> 13.0'
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  pod 'Kingfisher', '~> 5.0'
end


target 'desafio-consulta-remedios' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  shared_pods
  pod 'SwiftLint'

  target 'desafio-consulta-remediosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'desafio-consulta-remediosUITests' do
    shared_pods
  end
end