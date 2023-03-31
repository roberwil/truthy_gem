require_relative 'lib/ada_truthy/version'

Gem::Specification.new do |s|
  s.name                  = "ada_truthy"
  s.version               = AdaTruthy::VERSION
  s.summary               = "Create truth tables and operate with logical gates."
  s.description           = "Create truth tables and let truthy handle the annoying part. Also, operate with logical gates."
  s.authors               = "Roberto W. P. Ribeiro"
  s.email                 = "rober.will@hotmail.com"
  s.files                 = %w[
    lib/ada_truthy.rb
    lib/logical_gates/logical_gate.rb
    lib/logical_gates/logical_gate_extension.rb
    lib/truth_table/truth_table.rb
    lib/truth_table/truthy_exception.rb
  ]
  s.homepage              = "https://github.com/roberwil/truthy_gem"
  s.license               = "MIT"
  s.required_ruby_version = '>= 2.7.7'
end
