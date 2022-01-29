import 'package:flutter/material.dart';
import 'package:hello_world/model/Question.dart';

class MovieListView extends StatelessWidget {
  MovieListView({Key? key}) : super(key: key);

  final List movies = [
    "Avengers",
    "Heroes",
    "Peaky Blinders",
    "spiderMan",
    "Originals",
    "lagers",
    "Peaches",
    "spiderwoman",
    "vikings",
    "spiderMan",
    "Originals",
    "lagers",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Movies"), backgroundColor: Colors.blueGrey.shade800),
      backgroundColor: Colors.blueGrey.shade500,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 5.0,
                color: Colors.white,
                child: ListTile(
                    leading: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                            //color: Colors.black,
                            borderRadius: BorderRadius.circular(13.0)),
                        child: Text("M"),
                      ),
                    ),
                    trailing: Text("..."),
                    title: Text(movies[index]),
                    subtitle: Text("Avartar"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieListViewDetails(
                                    movieName: movies.elementAt(index),
                                  )));
                    }

                    //onTap: () => debugPrint("movies name: ${movies.elementAt(index)}"),

                    ));
          }),
    );
  }
}

//new route or new screen
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  const MovieListViewDetails({Key? key, required this.movieName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text("Movies"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Go Back ${this.movieName}"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("the avava bites industry was founded in 2020", true),
    Question.name("the avava bites industry was located in lagos", true),
    Question.name("Avava bites CEO is from Nsukka", true),
    Question.name(
        "the company has 30 trillion deposit in the reserve bank", false),
    Question.name("the new manager is also a millionare", true),
    Question.name("the headquarter is in akwa ibom", false),
    Question.name("honesty and satisfaction is there watchword", true),
    Question.name("the company is believed to have 25 mentors ", true),
    Question.name(
        "the group of industris are benefiting from the company", false),
    Question.name("there staff is always the best", true),
    Question.name("the industry does not have a male staff", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Center(
              child: Image.asset(
                "images/without.png",
                height: 300,
                width: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18.0),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid)),
                height: 200,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 22.0, color: Colors.white)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _prevQuestion(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(true, context),
                  child: Text("TRUE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false, context),
                  child: Text("FALSE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _nextQuestion(),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey.shade800,
                  ),
                )
              ],
            ),
            Spacer()
          ])),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //it is correct
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _updateQuestion();
      debugPrint("yes correct");
    } else {
      debugPrint("inCorrect");
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("inCorrect"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
      //this will help the list iterate to the last element and start from 0 again
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("index: $_currentQuestionIndex");
      //this will help the list iterate to the previous element and start again
    });
  }
}

class TipSplitter extends StatefulWidget {
  const TipSplitter({Key? key}) : super(key: key);

  @override
  _TipSplitterState createState() => _TipSplitterState();
}

class _TipSplitterState extends State<TipSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _bilAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Total Per Person",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "\$ ${calculateTotalPerPerson(_bilAmount, _personCounter, _tipPercentage)}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                        prefixText: "BillAmount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _bilAmount = double.parse(value);
                      } catch (exception) {
                        _bilAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.red.withOpacity(0.1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                )),
                          ),
                          Text(
                            "$_personCounter",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Text(
                          " \$ ${calculateTotalTip(_bilAmount, _personCounter, _tipPercentage)}",
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int tipPercentage, int splitBy) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Spread love everywhere you go. Let no one ever come to you without leaving happier. -Mother Teresa",
    "When you reach the end of your rope, tie a knot in it and hang on. -Franklin D. Roosevelt",
    "Always remember that you are absolutely unique. Just like everyone else. -Margaret Mead",
    "Tell me and I forget. Teach me and I remember. Involve me and I learn. -Benjamin Franklin",
    "The best and most beautiful things in the world cannot be seen or even touched — they must be felt with the heart. -Helen Keller",
    "It is during our darkest moments that we must focus to see the light. -Aristotle",
    "Whoever is happy will make others happy too. -Anne Frank",
    "Do not go where the path may lead, go instead where there is no path and leave a trail. -Ralph Waldo Emerso",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                  height: 300,
                  width: 350,
                  margin: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    quotes[_index % quotes.length],
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontStyle: FontStyle.italic,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          ), //module sign works with the remainder of a division

          const Divider(
            thickness: 2.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: TextButton.icon(
              onPressed: _showQuotes,
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent.shade200,
              ),
              icon: const Icon(Icons.wb_sunny),
              label: const Text(
                "inspire me!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  void _showQuotes() {
    setState(() {
      _index += 1;
    });
  }
}

class Bizcard extends StatelessWidget {
  const Bizcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BizCard"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: const EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Cornelius Michael O.",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          const Text("michaelcrnls@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.person_outline),
              Text(
                "@michaelcrnls.twit",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(60.0)),
          border: Border.all(color: Colors.redAccent, width: 2.0),
          image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  _tapButton() {
    debugPrint("tapped button");
  }

  terminus() {
    debugPrint("tapped account_balance");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flipkart"),
        centerTitle: false,
        backgroundColor: Colors.red.shade800,
        actions: [
          IconButton(
              icon: const Icon(Icons.email),
              onPressed: () => debugPrint("email tapped")),
          IconButton(
              icon: const Icon(Icons.access_alarms), onPressed: _tapButton),
          IconButton(
              icon: const Icon(Icons.account_balance),
              onPressed: () => debugPrint("tapped")),
          IconButton(
              icon: const Icon(Icons.wrong_location), onPressed: terminus)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(Icons.add_location),
          onPressed: () => debugPrint("tapped")),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "first",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "second",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar_rounded),
            label: "third",
          ),
        ],
        onTap: (int index) => debugPrint("tapped item: $index"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton()

              /*InkWell(
            child: Container(
              height: 100,
              width: 300,
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.red),
              child: const Center(
                child: Text(
                  "tap me",
                  style: TextStyle(fontSize: 54),
                ),
              ),
            ),
            onTap: () => debugPrint("tapped ...."),
          ),*/
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  get scaffold => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('welcome back cornelius'),
              backgroundColor: Colors.green,
            ),
          );
          scaffold.of(context).showSnackBar(SnackBar);
        },
        child: Container(
          padding: const EdgeInsets.all(10.8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.amber,
          ),
          child: const Text("Button"),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.green,
      child: Center(
        child: Text(
          "welcome back Mr cornelius",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 30.8),
        ),
      ),
    );
  }
}
