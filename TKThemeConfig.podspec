#
# Be sure to run `pod lib lint TKThemeConfig.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKThemeConfig'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TKThemeConfig.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
      ios暗黑模式,多主题多皮肤设计,用于解决在ios上实现可跟随系统主题变更，也可不跟随实现自定义主题模式设计。
      本sdk可以支持任意多个主题。开发习惯上极度契合ios开发习惯，对于复杂的主题设置类，均可使用对象的
      tkThemeChangeBlock进行回调设置变更。
      优势：
      1.代码无侵入,轻量级SDK。上手简单。完美解决多任务后台主题即时变更，屏幕快照变更主体。
      2.全局控制，效率极高。用hashmap的形式管理block指针对象，轻量。
      3.一切OC对象皆tkThemeChangeBlock主题回调，根据主题的目前的索引变更主题。
      4.常用的UIKit的组件，赋予主题属性，主题方法等。直接设置主题颜色、图片数组即可。
        完全契合系统设置属性，方法习惯。
      5.设计原理完美，弱引用的形式回调，不会对项目产生内存泄漏，内存占用不释放问题。UIKit-View层即用即注册，
        跟随对象释放即销毁。主题回调block即用即注册，跟随对象释放即销毁。
                       DESC

  s.homepage         = 'https://github.com/Tkoul/TKThemeConfig'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tkoul' => 'Tkoull@163.com' }
  s.source           = { :git => 'https://github.com/Tkoul/TKThemeConfig.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TKThemeConfig/Classes/**/*'
  s.public_header_files = 'TKThemeConfig/Classes/TKTheme/*.h','TKThemeConfig/Classes/TKThemeCategory/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
