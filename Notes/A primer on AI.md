# A primer on Artificial Intelligence (AI)
David Kelnar

>“The last 10 years have been about building a world that is mobile-first. In the next 10 years, we will shift to a world that is AI-first.” (Sundar Pichai, CEO of Google, October 2016)

## 1. What is AI?
### Artificial intelligence: The science of intelligent programs
Coined in 1956 by Dartmouth Assistant Professor John McCarthy, ‘Artificial Intelligence’ (AI) is a general term that refers to hardware or software that exhibits behaviour which appears intelligent. In the words of Professor McCarthy, it is “the science and engineering of making intelligent machines, especially intelligent computer programs.”
Basic ‘AI’ has existed for decades, via rules-based programs that deliver rudimentary displays of ‘intelligence’ in specific contexts. Progress, however, has been limited — because algorithms to tackle many real-world problems are too complex for people to program by hand.
Complicated activities including making medical diagnoses, predicting when machines will fail or gauging the market value of certain assets, involve thousands of data sets and non-linear relationships between variables. In these cases, it’s difficult to use the data we have to best effect — to ‘optimise’our predictions. In other cases, including recognising objects in images and translating languages, we can’t even develop rules to describe the featureswe’re looking for. How can we write a set of rules, to work in all situations, that describe the appearance of a dog?
What if we could transfer the difficulty of making complex predictions — the **data optimisation** and **feature specification** — from the programmer to the program? This is the promise of modern artificial intelligence.
![AI-1.png](http://blog.ligene.cn/imageBed/AI-1.png)


### Machine Learning: offloading optimisation

**Machine learning (ML)** is a sub-set of AI. All machine learning is AI, but not all AI is machine learning (Figure 1, above). Interest in ‘AI’ today reflects enthusiasm for machine learning, where advances are rapid and significant.
Machine learning lets us tackle problems that are too complex for humans to solve by shifting some of the burden to the algorithm. As AI pioneer Arthur Samuel wrote in 1959, machine learning is the ‘field of study that gives computers the ability to learn without being explicitly programmed.’
The goal of most machine learning is to develop a prediction engine for a particular use case. An algorithm will receive information about a domain (say, the films a person has watched in the past) and weigh the inputs to make a useful prediction (the probability of the person enjoying a different film in the future). By giving ‘computers the ability to learn’, we mean passing the task of optimisation — of weighing the variables in the available data to make accurate predictions about the future — to the algorithm . Sometimes we can go further, offloading to the program the task of specifying the features to consider in the first place.
Machine learning algorithms learn through training. An algorithm initially receives examples whose outputs are known, notes the difference between its predictions and the correct outputs, and tunes the weightings of the inputs to improve the accuracy of its predictions until they are optimised. The defining characteristic of machine learning algorithms, therefore, is that **the quality of their predictions improve with experience**. The more data we provide (usually up to a point), the better the prediction engines we can create (Figures 2 and 3, below. Note that the size of data sets required are highly context dependent — we cannot generalise from the examples below.)
![AI-2.png](http://blog.ligene.cn/imageBed/AI-2.png)

There are more than 15 approaches to machine learning, each of which uses a different algorithmic structure to optimise predictions based on the data received. One approach — ‘**deep learning**’ — is delivering breakthrough results in new domains and we explore this below. But there are many others which, although they receive less attention, are valuable because of their applicability to a broad range of usage cases. Some of the most effective machine learning algorithms beyond deep learning include:
* ‘**random forests**’ that create multitudes of decision trees to optimise a prediction;
* ‘**Bayesian networks**’ that use a probabilistic approach to analyse variables and the relationships between them; and
* '**support vector machines**' that are fed categorised examples and create models to assign new inputs to one of the categories.
Each approach has its advantages and disadvantages and combinations may be used (an ‘**ensemble**’ approach). The algorithms selected to solve a particular problem will depend on factors including the nature of the available data set. In practice, developers tend to experiment to see what works.
Use cases of machine learning vary according to our needs and imagination. With the right data we can build algorithms for myriad purposes including: suggesting the products a person will like based on their prior purchases; anticipating when a robot on a car assembly line will fail; predicting whether an email was mis-addressed; estimating the probability of a credit card transaction being fraudulent; and many more.
## Deep Learning: offloading feature specification
Even with general machine learning — random forests, Bayesian networks, support vector machines and more — it’s difficult to write programs that perform certain tasks well, from understanding speech to recognising objects in images. Why? Because we can’t specify the features to optimise in a way that’s practical and reliable. If we want to write a computer program that identifies images of cars, for example, we can’t specify the features of a car for an algorithm to process that will enable correct identification in all circumstances. Cars come in a wide range of shapes, sizes and colours. Their position, orientation and pose can differ. Background, lighting and myriad other factors impact the appearance of the object. There are too many variations to write a set of rules. Even if we could, if wouldn’t be a scalable solution. We’d need to write a program for every type of object we wanted to identify.
Enter deep learning (DL), which has revolutionised the world of artificial intelligence. Deep learning is a sub-set of machine learning — one of the more than 15 approaches to it. All deep learning is machine learning, but not all machine learning is deep learning (Figure 1).

Deep learning is useful because it avoids the programmer having to undertake the tasks of **feature specification** (defining the features to analyse from the data) or **optimisation** (how to weigh the data to deliver an accurate prediction) — the algorithm does both.
How is this achieved? The breakthrough in deep learning is to model the brain, not the world. Our own brains learn to do difficult things — including understanding speech and recognising objects — not by processing exhaustive rules but through practice and feedback. As a child we experience the world (we see, for example, a picture of a car), make predictions (‘car!’) and receive feedback (‘yes!’). Without being given an exhaustive set of rules, we learn through training.
Deep learning uses the same approach. Artificial, software-based calculators that approximate the function of neurons in a brain are connected together. They form a ‘**neural network**’ which receives an input (to continue our example, a picture of a car); analyses it; makes a determination about it and is informed if its determination is correct. If the output is wrong, the connections between the neurons are adjusted by the algorithm, which will change future predictions. Initially the network will be wrong many times. But as we feed in millions of examples, the connections between neurons will be tuned so the neural network makes correct determinations on almost all occasions. Practice makes (nearly) perfect.
Using this process, with increasing effectiveness we can now:
* recognise elements in pictures;
* translate between languages in real-time
* use speech to control devices (via Apple’s Siri, Google Now; Amazon Alexa and Microsoft Cortana);
* predict how genetic variation will effect DNA transcription;
* analyse sentiment in customer reviews;
* detect tumours in medical images; and more.
Deep learning is not well suited to every problem. It typically requires large data sets for training. It takes extensive processing power to train and run a neural network. And it has an ‘explainability’ problem — it can be difficult to know how a neural network developed its predictions. But by freeing programmers from complex feature specification, deep learning has delivered successful prediction engines for a range of important problems. As a result, it has become a powerful tool in the AI developer’s toolkit.

## 2. How does deep learning work?

Given its importance, it’s valuable to understand the basics of how deep learning works. Deep learning involves using an artificial ‘**neural network**’ — a collection of ‘neurons’ (software-based calculators) connected together.

An artificial neuron has one or more inputs. It performs a mathematical calculation based on these to deliver an output. The output will depend on both the ‘**weights**’ of each input and the configuration of ‘input-output function’ in the neuron (Figure 5, below). The input-output function can vary. A neuron may be:

* a **linear unit** (the output is proportional to the total weighted input;
* a **threshold unit** (the output is set to one of two levels, depending on whether the total input is above a specified value); 
* a **sigmoid unit** (the output varies continuously, but not linearly as the input changes).

A neural network is created when neurons are connected to one another; the output of one neuron becomes an input for another (Figure 6, below).
![AI-6.png](http://blog.ligene.cn/imageBed/AI-6.png)

Neural networks are organised into multiple layers of neurons (hence ‘deep’ learning). The ‘input layer’ receives information the network will process — for example, a set of pictures. The ‘output layer’ provides the results. Between the input and output layers are ‘hidden layers’ where most activity occurs. Typically, the outputs of each neuron on one level of the neural network serve as one of the inputs for each of the neurons in the next layer (Figure 7, below).
![AI-7.png](http://blog.ligene.cn/imageBed/AI-7.png)

Let’s consider the example of an image recognition algorithm — say, to recognise human faces in pictures. When data are fed into the neural network, the first layers identify patterns of local contrast — ‘low level’ features such as edges. As the image traverses the network, progressively ‘higher level’ features are extracted — from edges to noses, from noses to faces (Fig. 8, below)
![AI-8.png](http://blog.ligene.cn/imageBed/AI-8.png)


At its output layer, based on its training the neural network will deliver a probability that the picture is of the specified type (human face: 97%; balloon 2%; leaf 1%).

Typically, neural networks are trained by exposing them to a large number of labelled examples. Errors are detected and the weights of the connections between the neurons tuned by the algorithm to improve results. The optimisation process is extensively repeated, after which the system is deployed and unlabelled images are assessed.

The above is a simple neural network but their structure can vary and most are more complex. Variations include connections between neurons on the same layer; differing numbers of neurons per layer; and the connection of neuron outputs into the previous levels of the network (‘recursive’ neural networks).

Designing and improving a neural network requires considerable skill. Steps include structuring the network for a particular application, providing a suitable training set of data, adjusting the structure of the network according to progress, and combining multiple approaches.


## 5. What happens next?
The benefits of machine learning will be numerous and significant. Many will be visible, from autonomous vehicles to new methods of human-computer interaction. Many will be less apparent, but enable more capable and efficient day-to-day business processes and consumer services.
As with any paradigm shift, at times inflated expectations will exceed short-term potential. We expect a period of disillusionment regarding AI at some point in the future, to be followed by a longer and lasting recognition of its value as machine learning is used to improve and then reimagine existing systems.
Historically, industrial revolutions transformed production and communication through new sources of power and transmission. The first industrial revolution used steam power to mechanise production in the 1780s. The second used electricity to drive mass production in the 1870s. The third used electronics and software to automate production and communication from the 1970s. Today, as software eats the world, our primary source of value creation is the processing of information. By enabling us to do so more intelligently, machine learning will yield benefits both humble and historic.

本文节选自英国MMC Ventures公司David Kelnar写的AI综述: [The fourth industrial revolution: a primer on Artificial Intelligence (AI)](https://zhuanlan.zhihu.com/p/24435190)