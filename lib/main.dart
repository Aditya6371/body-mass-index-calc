import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body Mass Index',
      theme: ThemeData(
        primaryColor: Colors.black45,
        hintColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.cyan.shade600),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white54),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightcontroller = TextEditingController();

  final TextEditingController _weightcontroller = TextEditingController();
  Color colors = Colors.transparent;
  var main_result = "Enter The Values";
  var text = "";

  void calculate(String height, String weight) {
    double h = double.parse(height);
    double w = double.parse(weight);

    var res = (w / (h * h));

    setState(() {
      main_result = res.toStringAsFixed(2);
      if (res < 18.5) {
        colors = Colors.white;
        text = "Underweight";
      } else if (res >= 18.5 && res <= 24.9) {
        colors = Colors.green;
        text = "Normal";
      } else if (res >= 25 && res <= 29.9) {
        colors = Colors.yellow;
        text = "Overweight";
      } else if (res >= 30 && res <= 34.9) {
        colors = Colors.orange;
        text = "Obese";
      } else if (res >= 35) {
        colors = Colors.red;
        text = "Extreme";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 96, 174),
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Body Mass Index",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.transparent,
            height: mediaquery.size.height * 0.25,
            child: Image.asset("images/bmi_icon.png"),
          ),
          Container(
            height: mediaquery.size.height * 0.75,
            decoration: const BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: colors,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: mediaquery.size.height * 0.2,
                  width: mediaquery.size.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          main_result,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          text,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: _heightcontroller,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            labelStyle: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(),
                            labelText: 'Height(m)',
                            hintText: 'Enter Your Height'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _weightcontroller,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500),
                            labelText: 'Weight(kg)',
                            hintText: 'Enter Your Weight'),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    calculate(_heightcontroller.text, _weightcontroller.text);
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          const Text(
                            "Underweight",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          const Text(
                            "Normal",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          const Text(
                            "Overweight",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          const Text(
                            "obese",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          const Text(
                            "Extreme",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
