# frozen_string_literal: true

require 'whirlpool/version'
require 'wasmer'

module Whirlpool
  class << self
    attr_accessor :instance
  end

  self.instance = Wasmer::Instance.new IO.read(File.join(File.dirname(__FILE__), 'whirlpool.wasm'), mode: 'rb')

  def self.digest(str)
    subject = str.to_s.bytes
    length_of_subject = subject.size
    input_pointer = instance.exports.allocate length_of_subject

    memory = instance.memory.uint8_view input_pointer

    length_of_subject.times do |nth|
      memory[nth] = subject[nth]
    end

    memory[length_of_subject] = 0

    output_pointer = instance.exports.whirlpool input_pointer
    memory = instance.memory.uint8_view output_pointer

    digest_result = ''
    length_of_output = 0

    memory.each_with_index do |char, _index|
      break if char.zero?

      digest_result += char.chr
      length_of_output += 1
    end

    instance.exports.deallocate(input_pointer, length_of_subject)
    instance.exports.deallocate(output_pointer, length_of_output)
    digest_result
  end
end
