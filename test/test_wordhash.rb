require 'minitest/autorun'
require 'wordhash'
require 'digest'
require 'byebug'

class WordhashTest < Minitest::Test
  def test_thing
    test_hash = Digest::MD5.hexdigest("stuff")
    word = Wordhash::wordhash( test_hash )
    assert_equal "scleritic", word

    test_hash = Digest::MD5.hexdigest("things")
    word = Wordhash::wordhash( test_hash )
    assert_equal "ultrastructure", word

    test_hash = Digest::MD5.hexdigest("8273872978987928")
    word = Wordhash::wordhash( test_hash )
    assert_equal "woodside", word
  end
end
