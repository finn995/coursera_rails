
class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number

  #@@highest_wf_words = []  # VII

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency()
  end

  def calculate_word_frequency()
    @highest_wf_count = Hash.new
    @highest_wf_words = Array.new

    @content.split.each do |word|
      if @highest_wf_count.has_key?(word)
        @highest_wf_count[word] += 1
      else
        @highest_wf_count[word] = 1
      end
    end

    @highest_wf_count.each do |k, v| 
      @x = k if v == @highest_wf_count.values.max
      @highest_wf_words.push(@x) unless @highest_wf_words.include?(@x)
    end
    @highest_wf_count = @highest_wf_count.values.max
  end

end


class Solution
  attr_accessor :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize()
    @analyzers = []
  end

  def analyze_file()
    File.open('test.txt', 'r').each_line do |line, line_number|
      @analyzers << LineAnalyzer.new(line, line_number)
    end
  end

  def calculate_line_with_highest_frequency()
    @highest_count_across_lines = 0
    @analyzers.each do |lineanalyzer|
      if lineanalyzer.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = lineanalyzer.highest_wf_count
        #@y = lineanalyzer
      end
  end
    @highest_count_words_across_lines = []
    #@highest_count_words_across_lines << @y
    @analyzers.each do |la|
      @highest_count_words_across_lines << la.highest_wf_words if la.highest_wf_count == @highest_count_across_lines
    end
  end

  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    puts @highest_count_words_across_lines
  end

end
