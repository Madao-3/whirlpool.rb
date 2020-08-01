# frozen_string_literal: true

require_relative 'lib/whirlpool/version'

Gem::Specification.new do |spec|
  spec.name          = 'whirlpool'
  spec.version       = Whirlpool::VERSION
  spec.authors       = ['madao']
  spec.email         = ['madao.chen@flexport.com']

  spec.summary       = 'Whirlpool.rb is WebAssembly implementation of the Whirlpool cipher.'
  spec.description   = 'Whirlpool is a hash designed after the Square block cipher, and is considered to be in that family of block cipher functions.'
  spec.homepage      = 'https://github.com/Madao-3/whirlpool.rb'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Madao-3/whirlpool.rb.git'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'wasmer'
end
