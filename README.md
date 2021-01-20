# Word_Chain
This is a game that children play to improve their English vocabulary.  

Given two words of equal length as command-line arguments, this program builds a chain of words connecting the first to the second.  
Each word in the chain must be in the dictionary and every step along the chain changes exactly one letter from the previous word.  

```
$ time ruby -d word_chain.rb duck ruby  
Loading dictionary...  
Building chain...  
duck  
ruck  
rusk  
ruse  
rube  
ruby  
```
