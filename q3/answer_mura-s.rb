class Shiritori
  def initialize(com)
    @com = com
    @used_words = Hash.new { |hash, key| hash[key] = [] }
  end

  def play
    puts "しりとりスタート！（ひらがなで入力してください）"
    your_words = []

    loop do
      print "you:"
      your_word = gets.chomp
      unless valid?(your_word)
        puts "you lose!"
        break
      end
      your_words << your_word

      com_word = @com.choice_word(your_word)
      puts "com:#{com_word}"
      unless valid?(com_word)
        puts "you win!"
        break
      end
    end

    @com.expand_wordlist(your_words)
  end

  private

  def valid?(word)
    return false unless word
    return false unless /^[\p{Hiragana}ー]+$/.match(word)
    return false if word[-1] == 'ん'
    return false if @used_words[word[0]].include?(word)

    @used_words[word[0]] << word
    true
  end
end

class Com
  attr_reader :words

  def initialize
    @init_words = read_words
    @com_words = Marshal.load(Marshal.dump(@init_words))
  end

  def choice_word(last_word)
    choices = @com_words[last_word[-1]]
    choice = choices.sample
    choices.delete(choice)
    choice
  end

  def expand_wordlist(words)
    File.open("wordlist.txt", "a") do |file|
      words.each do |word|
        file.write("\n#{word}") unless @init_words.include?(word)
      end
    end
  end

  private

  def read_words
    words = Hash.new { |hash, key| hash[key] = [] }
    IO.foreach("wordlist.txt") do |word|
      word = word.chomp
      words[word[0]] << word if word && !words[word[0]].include?(word)
    end
    words.default_proc = nil
    words
  end
end

Shiritori.new(Com.new).play
