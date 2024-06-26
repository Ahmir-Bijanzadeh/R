#text processing in R
#install.packages("tidytext")
library(tidyverse)
library(tidytext)
#library(tm)

#mydata %>% unnest_tokens(input = "text",output = "word")

text = c("Because I could not stop for Death -",
          "He kindly stopped for me -",
          "The Carriage held but just Ourselves -",
          "and Immortality")
text_df = tibble(line = 1:4, text = text)
text_df %>% unnest_tokens(input=text, output="word")

text_df %>% group_by(word) %>% summarise(n())
#Shorter, more readable:
text_df %>% count(word)

mydata = read_csv("C:/Users/ahmir/OneDrive/Desktop/375/code/hashcsufnew.csv")

#mydata %>% unnest_tweets(input="mydata", output="text") #R says unnest tweets has been depreciated

mydata %>% select("text") %>%  unnest_tokens(input="text", output="word") #tidy the data

#testing counting function
#mydata %>% count("text")
#mydata %>% count("word")

#count word occurences (descending order to show highest occurences)
mydata %>% select(text) %>% unnest_tokens(input = text, output = "word") %>% count(word) %>% arrange(-n) %>% view()
#count hashtag occurences (descending order to show highest occurences)
mydata %>% select(hashtags) %>% unnest_tokens(input = hashtags, output = "word") %>% count(word) %>% arrange(-n) %>% view()


#word cloud testing
library(wordcloud)
install.packages("wordcloud")
wordcloud(c("hello","hi","sup"),c(23,34,54))


#wordcloud of csuf twitter data
cloudme = mydata %>% select(text) %>% unnest_tokens(input = text, output = "word") %>% count(word) %>% arrange(-n) %>% filter(n>200) %>% view()
wordcloud(cloudme$word, cloudme$n)


#stop words
stop_words %>% group_by(lexicon) %>% count()

#stemming
library(SnowballC)
wordStem("learned")
wordStem("learning")
wordStem("learns")
wordStem(("learning]"))

#word cloud again but cleaning all the filler words
cloudme = mydata %>% select(text) %>% unnest_tokens(input = text, output = "word") %>% count(word) %>% arrange(-n) %>% filter(n>200) %>% mutate(word= wordStem(word)) %>% anti_join(stop_words) %>% view()
wordcloud(cloudme$word, cloudme$n)
