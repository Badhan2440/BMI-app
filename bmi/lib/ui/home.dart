import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _reading = "";
  String _finalResult= "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || inches > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703;

        //Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _reading = "Underweight";
          print(_reading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 && result<25.0) {
          _reading = "Great Shape! Your BMI is NORMAL...";
          print(_reading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 && result<30) {
          _reading = "OVERWEIGHT";
          print(_reading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _reading = "OBESITY-1... You are in great risk!!!!";
          print(_reading);
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult= "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmi.png',
              height: 100.0,
              width: 100.0,
            ),
            new Container(
                margin: const EdgeInsets.all(3.0),
                height: 300.0,
                width: 290.0,
                color: Colors.grey.shade200,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'AGE',
                          hintText: 'e.g: 34',
                          icon: new Icon(Icons.person_outline)),
                    ),
                    new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'HEIGHT(in feet)',
                          hintText: 'e.g: 6.5',
                          icon: new Icon(Icons.insert_chart)),
                    ),
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'WEIGHT(in lbs)',
                          hintText: 'e.g: 180',
                          icon: new Icon(Icons.line_weight)),
                    ),
                    new Padding(padding: new EdgeInsets.all(20.6)),
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: _calculateBMI,
                        color: Colors.blue,
                        child: new Text('CALCULATE'),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text("$_reading",
                  style: new TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
