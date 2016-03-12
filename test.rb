require 'matrix'
require 'tf-idf-similarity'
require 'ai4r'
require 'benchmark'
require 'narray'

Article = Struct.new(:category, :weight, :text)

corpus = []
articles = []
dictionary = ["kypriako", "podosfairo", "oikonomia", "lifestyle", "techonologia", "egklimata", "metanastefsi", "ekklhsia", "xrhmatistirio"]

50.times do |t|
  prng = Random.new
  a = prng.rand(4..8)
  d = ""
  a.times do |b|
    c = Random.new
    e = c.rand(0..dictionary.length-1)
    d += dictionary[e]
    d += " "
  end
  doc = TfIdfSimilarity::Document.new(d)
  corpus << doc
  articles << Article.new([0,0],0,doc.text)
end

model = TfIdfSimilarity::TfIdfModel.new(corpus, :library => :narray)

SOM_DATA = model.matrix.to_a

#puts "Nodes: #{t}"
som = Ai4r::Som::Som.new(50, 4, Ai4r::Som::TwoPhaseLayer.new(50))
som.initiate_map

#puts "global error distance: #{som.global_error(SOM_DATA)}"
#puts "\ntraining the som\n"

times = Benchmark.measure do
  som.train SOM_DATA
end


(0..3).each do |x|
  (0..3).each do |y|
    i = 0
    # print  som.get_node(x,y).instantiated_weight
    som.get_node(x,y).instantiated_weight.each {|w|
      if(articles[i][:weight] < w)
        articles[i][:weight] = w
        articles[i][:category] = [x,y]
      end
      i = i+1
    }
  end
end

CSV.open("results.csv", "wb") do |csv|
  articles.each { |a|
    csv << [a[:category][0], a[:category][1], (a[:weight]*100).round, a[:text]]    
  }
end
