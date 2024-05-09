import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI calci",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController wtController = TextEditingController();

  TextEditingController ftController = TextEditingController();

  TextEditingController inchController = TextEditingController();

  var result = "";
  var bgcolor=Colors.indigo.shade200;
  var msg="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Body Mass Index",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: Container(
        color: bgcolor,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: wtController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text("Enter Your weight (in Kgs)"),
                  prefixIcon: Icon(Icons.line_weight)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: ftController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Enter your height (in feet)"),
                prefixIcon: Icon(Icons.height),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: inchController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Enter Your height (in inch)"),
                prefixIcon: Icon(Icons.height),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.toString();
                  var hft = ftController.text.toString();
                  var hinch = inchController.text.toString();
      
                  if (wt != "" && hft != "" && hinch != "") {
                    //BMI Calculator
      
                    var iwt = int.parse(wt);
                    var ihft = int.parse(hft);
                    var ihinch = int.parse(hinch);
      
                    var tinch = (ihft * 12) + ihinch;
      
                    var thcm = tinch * 2.25;
                    var thm = thcm / 100;
      
                    double bmi = iwt/(thm*thm);

                    if(bmi>25){
                      msg="You are over weight";
                      bgcolor=Colors.orange;
                    }else if(bmi<18){
                      msg="You are under weight";
                      bgcolor=Colors.red;
                    }else{
                      msg="You are healthy";
                      bgcolor=Colors.green;
                    }

                     setState(() {
                    result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    const SizedBox(height: 10,);
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }
                },
                child: const Text(
                  "Result",
                  style: TextStyle(color: Colors.white),
                )),
            Text(
              result,
              style: const TextStyle(fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }
}
