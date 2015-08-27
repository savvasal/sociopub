require 'matrix'
# ellada = Pismo::Document.new('http://www.politis-news.com/cgibin/hweb?-A=300444&-V=articles')
# arthro = TfIdfSimilarity::Document.new(ellada.body)
# corpus = Array.new
documents = Array.new
#start = Time.now.to_f
Entry.take(200).each do |e|
 doc = Pismo::Document.new(e.url)
# bod = TfIdfSimilarity::Document.new(doc.body)
# corpus << bod
 documents << doc.body
end
#stop = Time.now.to_f
#read_docs = stop - start

#start = Time.now.to_f
search = RSemantic::Search.new(documents, :transforms => [:TFIDF])
#stop = Time.now.to_f
#search_time = stop - start
    
# corpus.length
# new_corpus = Array.new
# corpus << arthro
# start = Time.now.to_f
# model = TfIdfSimilarity::TfIdfModel.new(corpus)
# stop = Time.now.to_f
# create_model = stop - start
# start = Time.now.to_f
# matrix = model.similarity_matrix
# stop = Time.now.to_f
# create_matrix = stop - start

corpus.class
nearest = Array.new
corpus.each do |c|
 nearest << matrix[model.document_index(c), model.document_index(arthro)]
end

nearest.pop
# nearest.each_with_index.max[1]
ary = Entry.take(3)
ary[nearest.each_with_index.max[1]]

paromoio = corpus[nearest.each_with_index.max[1]]
tfidf_by_term = {}	
paromoio.terms.each do |term|
  tfidf_by_term[term] = model.tfidf(paromoio, term)
end
puts tfidf_by_term.sort_by{|_,tfidf| -tfidf}.take(2)



require 'matrix'
corpus = Array.new
doc = Pismo::Document.new('http://www.politis-news.com/cgibin/hweb?-A=300496&-V=articles')
ellada = TfIdfSimilarity::Document.new(doc.body)
doc = Pismo::Document.new('http://www.politis-news.com/cgibin/hweb?-A=300486&-V=articles')
ela = TfIdfSimilarity::Document.new(doc.body)
doc = Pismo::Document.new('http://www.politis-news.com/cgibin/hweb?-A=300504&-V=articles')
ethapsan = TfIdfSimilarity::Document.new(doc.body)
corpus << ellada
corpus << ela
corpus << ethapsan
model = TfIdfSimilarity::TfIdfModel.new(corpus)
matrix = model.similarity_matrix

nearest = Array.new
nearest << matrix[model.document_index(corpus[0]), model.document_index(corpus[1])]
nearest << matrix[model.document_index(corpus[0]), model.document_index(corpus[2])]
nearest << matrix[model.document_index(corpus[2]), model.document_index(corpus[1])]

 
require 'matrix'
# ellada = Pismo::Document.new('http://www.po$
# arthro = TfIdfSimilarity::Document.new(ella$
corpus = Array.new
start = Time.now.to_f
Entry.take(200).each do |e|
 doc = Pismo::Document.new(e.url)
  bod = TfIdfSimilarity::Document.new(doc.body)
   corpus << bod
   end
   stop = Time.now.to_f
  read_docs = stop - start
   
   # corpus.length
   # new_corpus = Array.new
   # corpus << arthro
   start = Time.now.to_f
   model = TfIdfSimilarity::TfIdfModel.new(corpu$
   stop = Time.now.to_f
   create_model = stop - start
   start = Time.now.to_f
   matrix = model.similarity_matrix
   stop = Time.now.to_f
   create_matrix = stop - start
   