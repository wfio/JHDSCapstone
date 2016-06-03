library('tm')

corpus <- VCorpus(DirSource("~/GitHub/capstone/corpus/", encoding="UTF-8")
                 , readerControl = list(language="english"))
summary(corpus)

corpus <- VCorpus(DirSource("~/GitHub/capstone/corpus/subset/", encoding="UTF-8")
                  , readerControl = list(language="english"))

#normalize the corpus
corpus <- tm_map(corpus, removePunctuation) #remove punction - could have gsub'd
corpus <- tm_map(corpus, stripWhitespace) #remove whitespaces
corpus <- tm_map(corpus, content_transformer(tolower), lazy = TRUE) #lowercase

#remove 'stopwords' -- words that are very common in the english language
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stemDocument, lazy = TRUE, language = "english") #stem words




