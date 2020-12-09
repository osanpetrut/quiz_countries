import 'package:country_frag/game_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guess the flags',
          style: TextStyle(fontFamily: 'NerkoOne', fontSize: 32.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ask.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  'How well do you know the countries',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const Center(
                child: Image(
                  image: AssetImage('images/ask2.jpg'),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.white),
                      ),
                      color: Colors.green,
                      child: const Text(
                        'Play game',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push<HomePage>(
                          context,
                          MaterialPageRoute<HomePage>(
                            builder: (BuildContext context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
