require 'narray'

array = Entry.where("language = 'english'")
corpus = []

array.each do |entry|
  document = TfIdfSimilarity::Document.new(entry.content)
  corpus << document
end

model = TfIdfSimilarity::TfIdfModel.new(corpus, :library => :narray)

matrix = model.similarity_matrix
# Στόχος - να βρούμε 9 άρθρα που είναι πολύ κοντά το ένα στο άλλο
my_articles = []
# αρχικοποίηση πίνακα με ένα τυχαίο άρθρο -  τελευταίο
ind = 0
my_articles << ind
matrix[ind,ind] = -1
articles_count = {}
# μέχρι να συμπληρωθούν 9 άρθρα επανέλαβε
while my_articles.length < 9 do
  # για το κάθε άρθρο του πίνακα με τα άρθρα που ψάχνουμε τα κοντινά τους 
  my_articles.each do |i|
    # βρες το πιο κοντινό του που δεν έχει ελέγξει
    ind = matrix.to_a[i].index(matrix.to_a[i].max)
    # αύξησε το μετρητή του άρθρου στη λίστα με τα άρθρα
    articles_count[ind.to_s] += 1
    matrix[i,ind] = -1
    # έλεγξε αν η τιμή του μετρητή ισούται με το μέγεθος της λίστα
    if articles_count[ind.to_s] == my_articles.length then
      # τότε πρόσθεσε αυτό το άρθρο στη λίστα με τα άρθρα
      my_articles << ind
      matrix[ind,ind] = -1
    end
    # αν η λίστα με τα άρθρα έχει μέγεθος 9, βγες
    if my_articles.length == 9 then
      break
    end
  end
end


matrix = model.similarity_matrix
my_articles = []
ind = 0
my_articles << ind
matrix[ind,ind] = -1
articles_count = {}
while my_articles.length < 9 do
  my_articles.each do |i|
    ind = matrix.to_a[i].index(matrix.to_a[i].max)
    articles_count[ind.to_s] += 1
    matrix[i,ind] = -1
    if articles_count[ind.to_s] == my_articles.length then
      my_articles << ind
      matrix[ind,ind] = -1
    end
    if my_articles.length == 9 then
      break
    end
  end
end


k_hash = {}
for i in 60..90  # array.length-1
  puts i
  current_h = {}
  if model.documents[i].size < 20 then
    next
  end
  model.documents[i].terms.each do |term|
    current_h[term] = model.tfidf(model.documents[i],term)
  end
  top_terms = {}  
  for j in 0..10
    max_key = current_h.max_by{|k,v| v}[0]
    top_terms[max_key] = model.documents[i].term_counts[max_key]
    current_h.delete(max_key)
  end
  k_hash[array[i].title] = top_terms      
end
hcluster = Kmeans::HCluster.new
values = k_hash.values.map {|x| x.values}
clust = hcluster.hcluster(values)
dendrogram = Kmeans::Dendrogram.new( :imagefile => 'demo2.png')
dendrogram.drawdendrogram(clust, k_hash.keys)

a = []
b = []
c = []
d = []
e = []
for i in 0..corpus.length-1
  if matrix[1,model.document_index(corpus[i])] > 0.08 && i!=1 then 
    a << i
  elsif  matrix[1,model.document_index(corpus[i])] > 0.06
    b << i
  elsif  matrix[1,model.document_index(corpus[i])] > 0.04
    c << i
  elsif  matrix[1,model.document_index(corpus[i])] > 0.02
    d << i
  else
    e << i
  end
  
end
