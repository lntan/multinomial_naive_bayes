#### Use case

Assume that we have 6 documents as the training set. The size of the vocabulary is 6. All documents are categorized into two categories, "SAD" and "HAPPY". The number is how many times the word appears in the document. For example, the word "love" appears in document D0 twice.

|TRAINING DOC|love|without|anger|burst|sleep|possible|CLASS|
| ------------- |:-------------:| -----:|-----:|-----:|-----:|-----:|-----:|
|D0|2|1|3|0|0|1|SAD|
|D1|1|1|1|0|0|0|SAD|
|D2|1|1|2|0|1|0|SAD|
|D3|0|1|0|2|1|1|HAPPY|
|D4|0|0|1|1|1|0|HAPPY|
|D5|0|0|0|2|2|0|HAPPY|
