import 'dart:async';
import 'dart:math';

import 'package:country_frag/result_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  final List<String> flags = <String>[];
  final List<String> country = <String>[];
  int numberFlagsAndCountries = 0;
  int elementFlagAndCountry;
  Random randomFlag;
  int button2;
  int button3;
  int button4;
  Random random2Button;
  int element2Button;
  int result = 0;
  int counter = 30;
  Timer timer;

  @override
  void initState() {
    // TODO(this): implement initState
    super.initState();
    _getFlags();
    randomFlagAndCountry();
  }

  Future<void> _getFlags() async {
    setState(() => isLoading = true);

    final Response response = await get(
        'https://www.worldometers.info/geography/flags-of-the-world/');

    final List<String> value = response.body
        .split('<div align="center" style="margin-top:10px "><a href="')
        .skip(1)
        .toList();
    for (final String item in value) {
      country.add(
          item.split('padding-top:10px">')[1].split('</div></div></div>')[0]);
      flags.add('https://www.worldometers.info${item.split('.gif')[0]}.gif');
      numberFlagsAndCountries++;
    }
    print('numberFlagsAndCountries : ' + numberFlagsAndCountries.toString());

    setState(() => isLoading = false);
  }

  String randomFlagAndCountry() {
    randomFlag = Random();
    elementFlagAndCountry = randomFlag.nextInt(195);
    button2 = Random().nextInt(195);
    button3 = Random().nextInt(195);
    button4 = Random().nextInt(195);
    return '';
  }

  void startTime() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer time) {
        setState(
          () {
            if (counter > 0) {
              counter--;
            } else {
              timer.cancel();
            }
            if (counter == 0) {
              Navigator.push<SecondPage>(
                  context,
                  MaterialPageRoute<SecondPage>(
                      builder: (BuildContext context) =>
                          SecondPage(result: result)));
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (flags.isEmpty) {
      return Container();
    }
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Image.network(
                flags[elementFlagAndCountry],
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  result++;
                  setState(
                    () {
                      randomFlagAndCountry();
                    },
                  );
                },
                child: Text(
                  country[elementFlagAndCountry],
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(
                    () {
                      randomFlagAndCountry();
                      if (button2 == elementFlagAndCountry) {
                        randomFlagAndCountry();
                      }
                    },
                  );
                },
                child: Text(
                  country[button2],
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(
                    () {
                      randomFlagAndCountry();
                      if (button3 == elementFlagAndCountry) {
                        randomFlagAndCountry();
                      }
                    },
                  );
                },
                child: Text(
                  country[button3],
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: const BorderSide(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(
                    () {
                      randomFlagAndCountry();
                      if (button3 == elementFlagAndCountry) {
                        randomFlagAndCountry();
                      }
                    },
                  );
                },
                child: Text(
                  country[button4],
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(counter.toString()),
                      onPressed: () {
                        startTime();
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
