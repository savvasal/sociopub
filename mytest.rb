require 'narray'

array = Entry.where("language = 'english'")
corpus = []

array.each do |entry|
  document = TfIdfSimilarity::Document.new(entry.content)
  corpus << document
end

model = TfIdfSimilarity::TfIdfModel.new(corpus, :library => :narray)

matrix = model.similarity_matrix

def generate_articles(matrix, array, model)
  matrix_array = matrix.to_a
  # Στόχος - να βρούμε 9 άρθρα που είναι πολύ κοντά το ένα στο άλλο
  my_articles = []
  # αρχικοποίηση πίνακα με ένα τυχαίο άρθρο -  τελευταίο
  # τη πρώτη φορα να ναι τυχαίο - 
  ind = rand(array.length)
  my_articles << ind
  matrix_array[ind][ind] = -1
  articles_count = Hash.new(0)
  # μέχρι να συμπληρωθούν 9 άρθρα επανέλαβε
  begin
    # για το κάθε άρθρο του πίνακα με τα άρθρα που ψάχνουμε τα κοντινά τους 
    my_articles.each do |i|
      # βρες το πιο κοντινό του που δεν έχει ελέγξει
      ind = matrix_array[i].index(matrix_array[i].max)
      # αύξησε το μετρητή του άρθρου στη λίστα με τα άρθρα
      articles_count[ind.to_s] += 1
      matrix_array[i][ind] = -1
      # έλεγξε αν η τιμή του μετρητή ισούται με το μέγεθος της λίστα
      if articles_count[ind.to_s] == my_articles.length then
        # τότε πρόσθεσε αυτό το άρθρο στη λίστα με τα άρθρα
        my_articles << ind
        matrix_array[ind][ind] = -1
      end
      # αν η λίστα με τα άρθρα έχει μέγεθος 9, βγες
      if my_articles.length == 9 then
        break
      end
    end
  end while my_articles.length < 9 

  
  my_articles.each do |i|
    puts array[i].url    
  end
  
  keywords_array = model.documents[my_articles[0]].terms &  model.documents[my_articles[1]].terms &  model.documents[my_articles[2]].terms &  model.documents[my_articles[3]].terms &  model.documents[my_articles[4]].terms &  model.documents[my_articles[5]].terms &  model.documents[my_articles[6]].terms &  model.documents[my_articles[7]].terms &  model.documents[my_articles[8]].terms
  
  terms_freq = {}
  
  keywords_array.each do |t|
    terms_freq[t] = model.tfidf(model.documents[0], t)
  end

  keywords.to_h = Hash[terms_freq.sort_by{|k, v| v}.reverse].to_a.take(10)
  keywords.each do |k|
    print k
  end
  
end

