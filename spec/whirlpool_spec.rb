# frozen_string_literal: true

RSpec.describe Whirlpool do
  it 'has a version number' do
    expect(Whirlpool::VERSION).not_to be nil
  end

  # Testcases accroding by Wiki page.
  # https://en.wikipedia.org/wiki/Whirlpool_(hash_function)

  # "The quick brown fox jumps over the lazy dog"
  it 'digest right in empty str' do
    expect(Whirlpool.digest('')).to eq('19fa61d75522a4669b44e39c1d2e1726c530232130d407f89afee0964997f7a73e83be698b288febcf88e3e03c4f0757ea8964e59b63d93708b138cc42a66eb3')
  end

  # "The quick brown fox jumps over the lazy dog"
  it "digest right in 'The quick brown fox jumps over the lazy dog'" do
    expect(Whirlpool.digest('The quick brown fox jumps over the lazy dog')).to eq('b97de512e91e3828b40d2b0fdce9ceb3c4a71f9bea8d88e75c4fa854df36725fd2b52eb6544edcacd6f8beddfea403cb55ae31f03ad62a5ef54e42ee82c3fb35')
  end

  # "The quick brown fox jumps over the lazy eog"
  it "digest right in 'The quick brown fox jumps over the lazy eog'" do
    expect(Whirlpool.digest('The quick brown fox jumps over the lazy eog')).to eq('c27ba124205f72e6847f3e19834f925cc666d0974167af915bb462420ed40cc50900d85a1f923219d832357750492d5c143011a76988344c2635e69d06f2d38c')
  end

  it 'allow you pass integer value' do
    expect(Whirlpool.digest(1)).to eq('8513c69d070a008df008aef8624ed24afc81b170d242faf5fafe853d4fe9bf8aa7badfb0fd045d7b350b19fbf8ef6b2a51f17a07a1f6819abc9ba5ce43324244')
  end
end
