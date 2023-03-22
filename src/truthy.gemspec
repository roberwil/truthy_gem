Gem::Specification.new do |s|
  s.name                  = "ada_truthy"
  s.version               = "1.0.0"
  s.summary               = "Create truth tables and operate with logical gates."
  s.description           = "Create truth tables and let truthy handle the annoying part. Also, operate with logical gates."
  s.authors               = "Roberto W. P. Ribeiro"
  s.email                 = "rober.will@hotmail.com"
  s.files                 = %w[lib/ada_truthy lib/logical_gates/*.rb lib/truth_table/*.rb]
  s.homepage              = "https://github.com/roberwil/truthy_gem"
  s.license               = "MIT"
  s.required_ruby_version = '>= 2.7.7'
  s.extra_rdoc_files      = ['GEM_README.md']
end
