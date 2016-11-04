class Wordhash
  def self.wordhash( hash )
    hash_int = hash.hex

    # find out where this int is out of all possible 128 bit values

    # max 128 bit int value
    # 340282366920938463463374607431768211455

    word_count = 350000
    # block_size = max_val / word_count
    # block_size = 340282366920938463463374607431768211455 / 350000
    block_size = 972235334059824181323927449805052

    word_no = hash_int / block_size

    words_per_file = 1000

    file_affix = word_no / words_per_file

    file_line = word_no % words_per_file

    filename = "words_" + file_affix.to_s.rjust(3, "0") + '.txt'

    word = File.open('data/'+filename, "r") do |f|
      (file_line-1).times { f.gets } # skip lines preceeding line N
      f.gets
    end

    word.strip
  end
end
