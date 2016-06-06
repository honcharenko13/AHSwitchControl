Pod::Spec.new do |s|
  s.name             = "AHSwitchControl"
  s.version          = "0.1.0"
  s.summary          = "The control that has similar behaviour as UISwitch and addititious options to adjust its interface."

  s.description      = <<-DESC
"The control that has similar behaviour as UISwitch. Pod allows to set its width and height, colors of its all parts. The control has two states: Off and On, and allows to set required color or value depending on state. Property "inset" allows to change  top, left, bottom and right sides of control together that is squeezes body of control from all sides. The control has border that is attribute from UISwitch. When property "inset" is bigger than 0 outer part of border is hided."
                       DESC

  s.homepage         = "https://github.com/honcharenko13/AHSwitchControl"
  s.license          = 'MIT'
  s.author           = { "Aleksandr" => "pfca13@gmail.com" }
  s.source           = { :git => "https://github.com/honcharenko13/AHSwitchControl.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'AHSwitchControl/Classes/AHSwitchControl.h'
  s.frameworks = 'UIKit'
end