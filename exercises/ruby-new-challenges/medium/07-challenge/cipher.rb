class Cipher
  def self.encode(str)
    chr_arr = str_process(str)
    process_chrs = chr_arr.map do |chr|
      chr_process(chr)
    end

    if chr_arr.size > 12
      process_chrs.each_slice(5).map(&:join).join(' ')
    else
      process_chrs.join
    end
  end

  def self.str_process(str)
    str.downcase.gsub(/[ ,.]/, '').chars
  end

  def self.chr_process(chr)
    chr.match?(/[0-9]/) ? chr : (219 - chr.ord).chr
  end
end
