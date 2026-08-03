def count_words(words):
   count = 0
   for word in words:
      if 'dan' in word.lower():
         count += 1
   return count
   
words = ['Dan', 'dancing', 'Dandelion', 'apple', 'banana']
print(count_words(words))  # 输出应为3


