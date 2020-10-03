# put info in txt file
# read from file
# store questions into master array
# go through master array, sorting into 3 arrays for 3 levels?
# maybe need to store dict of freqs
#   if it has yourself (prob easier)
#   if it has less frequent words, prob is harder/rarer
#   length of question -> longer = harder and shorter = easier

# at each sentence 
# .lower the sentence
# check length (split by space)
# check if contains you or yourself
# count frequency of each word, put into dictionary
from google.cloud import firestore
import string

import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate('firebase-sdk.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

file = open('test.txt', 'r')
questions = []
easy = []
medium = []
hard = []
totalfreq = {}
line = file.readline()
lower = 10
higher = 20
while line:
    for word in line.split(" "):
        # word = word.rstrip(",.?").lower()
        word = word.translate(str.maketrans('', '', string.punctuation))
        word = word.rstrip().lower()
        if word not in totalfreq:
            totalfreq[word] = 0
        totalfreq[word] += 1
    # frequency.update(line.rstrip().lower())
    questions.append(line)
    line = file.readline()
print(totalfreq)

for question in questions:
    score = 0
    wordfreq = {}
    for word in question.split(" "):
        word = word.translate(str.maketrans('', '', string.punctuation))
        word = word.rstrip().lower()
        if word not in wordfreq:
            wordfreq[word] = 0
        wordfreq[word] += 1
    for word in wordfreq:
        score += wordfreq[word] * 10 / totalfreq[word] 

    #Factor in length of question
    score += len(question)
    print(question, score)
    if score < 150:
        easy.append(question)
    elif score < 250:
        medium.append(question)
    else:
        hard.append(question)

print(easy)
print(medium)
print(hard)

doc_ref = db.collection('level1')

index = 13
for q in easy:
    doc_ref.document(str(index)).set ({

        'questiontext' : q,
        'level' : 1,
        'timeAlloc' : 3

    })
    index += 1


doc_ref = db.collection('level2')
index = 5
for q in medium:
    doc_ref.document(str(index)).set ({

        'questiontext' : q,
        'level' : 2,
        'timeAlloc' : 3

    })
    index += 1

doc_ref = db.collection('level3')
index = 3
for q in hard:
    doc_ref.document(str(index)).set ({

        'questiontext' : q,
        'level' : 3,
        'timeAlloc' : 3

    })
    index += 1

