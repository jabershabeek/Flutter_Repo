import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(JaberApp());

class JaberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random Words App",
      home: RandomWordHome(),
    );
  }
}

class RandomWordHome extends StatefulWidget {
  @override
  _RandomWordHomeState createState() => _RandomWordHomeState();
}

class _RandomWordHomeState extends State<RandomWordHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Words"),
        backgroundColor: Colors.yellow,
      ),
      body: WordsListView(),
    );
  }
}

class WordsListView extends StatefulWidget {
  @override
  _WordsListViewState createState() => _WordsListViewState();
}

class _WordsListViewState extends State<WordsListView> {
  var wordsPair = <WordPair>[];
  var favPair = <WordPair>[];
  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder: (context, i)
    {
      if(i >= wordsPair.length)
        wordsPair.addAll(generateWordPairs().take(10));
      return ListTile(
        title: Text(wordsPair[i].asPascalCase),
        trailing: favPair.contains(wordsPair[i])? Icon(
          Icons.favorite,
          color: Colors.orange,
        ):Icon(
          Icons.favorite,
          color: null,
        ),
        onTap: (){
          setState(() {
            if(favPair.contains(wordsPair[i])){
              favPair.remove(wordsPair[i]);
            }
            else
              favPair.add(wordsPair[i]);
          });
        },
      );
    });
  }
}




