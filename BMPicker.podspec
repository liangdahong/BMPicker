Pod::Spec.new do |s|
s.name         = 'BMPicker'
s.version      = '0.0.7'
s.summary      = 'BMPicker 是一款自定义的时间选选择器，支持年，年月，年月日，年月日时，年月日时分，年月日时分秒'
s.homepage     = 'https://github.com/asiosldh/BMPicker'
s.license      = 'MIT'
s.authors      = {'asiosldh' => 'asiosldh@163.com', 'liangdahong' => 'liangdahong@bluemoon.com.cn'}
s.platform     = :ios, '7.0'
s.source       = {:git => 'https://github.com/asiosldh/BMPicker.git', :tag => s.version}
s.resources     = "BMPicker/BMPicker/**/*.{png,bundle,xib,nib,db}"
s.source_files = 'BMPicker/BMPicker/**/*.{h,m}'
s.public_header_files = 'BMPicker/BMPicker/BMPicker/BMPicker.h'
s.requires_arc = true
s.dependency "pop", "~> 1.0.9"
end
