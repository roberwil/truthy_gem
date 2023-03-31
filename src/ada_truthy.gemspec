require_relative 'lib/ada_truthy/version'

Gem::Specification.new do |spec|
  spec.name                        = "ada_truthy"
  spec.version                     = AdaTruthy::VERSION
  spec.summary                     = "Create truth tables and operate with logical gates."
  spec.description                 = "Create truth tables and let truthy handle the annoying part. Also, operate with logical gates like AND and OR."
  spec.authors                     = ["Roberto W. P. Ribeiro"]
  spec.email                       = ["rober.will@hotmail.com"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.homepage                    = "https://github.com/roberwil/truthy_gem"
  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/roberwil/truthy_gem"
  spec.metadata["changelog_uri"]   = "https://github.com/roberwil/truthy_gem/blob/main/CHANGELOG.md"
  spec.licenses                    = ["MIT"]
  spec.required_ruby_version       = Gem::Requirement.new(">= 2.7.7")

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
end
