TfIdfSimilarity::Document.module_eval do
  def set_term_counts_and_size    
    tokenize(text).each do |word|
      token = TfIdfSimilarity::Token.new(word)
      if token.valid? && !token.stop_word? then
        term = token.lowercase_filter.classic_filter.to_s
        term = Stemmer::stem_word(term)
        @term_counts[term] += 1
        @size += 1
      end
    end
  end
  
end
