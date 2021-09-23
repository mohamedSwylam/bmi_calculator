import 'package:flutter/material.dart';
import 'dart:math';

import 'bmi_screen_result.dart';



class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  Color color = Colors.teal;

  bool isMale = true;

  double height = 120;

  int weight = 60;

  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.teal : Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/male.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.grey[400] : Colors.teal,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/female.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.teal,
                      value: height,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                backgroundColor: Colors.teal,
                                mini: true,
                                heroTag: 'weight--',
                              ),
                              FloatingActionButton(
                                mini: true,
                                heroTag: 'weight++',
                                backgroundColor: Colors.teal,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                backgroundColor: Colors.teal,
                                mini: true,
                                heroTag: 'age--',
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.teal,
                                mini: true,
                                heroTag: 'age++',
                                onPressed: () {
                                  age++;
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.teal,
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                print(result.round());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                        result : result.round() ,
                        age: age ,
                        isMale : isMale ,
                      ),
                    ));
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
