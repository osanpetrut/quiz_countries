import 'package:country_frag/game_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key, @required this.result}) : super(key: key);
  final int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Correct answers',
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
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Congratulations, you have $result correct answer',
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(color: Colors.white),
              ),
              color: Colors.green,
              child: const Text('Try again'),
              onPressed: () {
                Navigator.push<HomePage>(
                  context,
                  MaterialPageRoute<HomePage>(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
