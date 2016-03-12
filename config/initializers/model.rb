TfIdfSimilarity::Model.module_eval do
  attr_reader :matrix
  def initialize(documents, opts = {})
    @model = TfIdfSimilarity::TermCountModel.new(documents, opts)
    @library = (opts[:library] || :matrix).to_sym

    array = Array.new(terms.size) do |i|
      idf = inverse_document_frequency(terms[i])
      Array.new(documents.size) do |j|
        term_frequency(documents[j], terms[i]) * idf
      end
    end
    
    @matrix = initialize_matrix(array)
  end

end
