# 🎥 Movie App

A Movie App based on clean architecture design pattern and cool
animation with scalablity.

## 🚗 Journey of Project :

1. What are you Building
2. How are you building

## 🦐 Step 3: Problem

You have seen in previous article, that we were calling data source from **main.dart**, which is your UI layer. In a long run, this is not right and certainly needs a layer in between. Also, what this does is, it tightly couples the UI layer with API responses, which can change over the time and you'll end up making changes to data layer as well as UI layer.

1. We will create repositories in domain layer which will have sole purpose of taking decision to fetch data from whether local or remote sources

2. We will also create usecases, basically one use case for one feature or one api.

3.We'll also create common error classes which will be returned from repositories and used by the UI layer.

[Main Lib used in this step: DARTZ 🎯]

## 💉 Step 4: Dependecy Injection
### Instances | Memory Wastage | Slow Code | Bloated Code

we have dependevies and for every use case we have to create these objects multiple times
[Main Lib used in this step: GETIT 🚀]