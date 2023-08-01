import 'dart:math';

import 'package:courses/views/BMI/bmi_result.dart';
import 'package:courses/widgets/CustomAppBar.dart';
import 'package:courses/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Bmi_Calculator_Screen extends StatefulWidget {
  const Bmi_Calculator_Screen({super.key});

  @override
  State<Bmi_Calculator_Screen> createState() => _Bmi_Calculator_ScreenState();
}

class _Bmi_Calculator_ScreenState extends State<Bmi_Calculator_Screen> {
  double sliderValue = 165;
  int age = 20;
  int weight = 61;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            height: 90,
            title: " BMI Calulator",
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: isMale
                              ? KmainColor
                              : const Color.fromARGB(255, 230, 230, 232),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.male,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          deflutText(text: 'Male'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: !isMale
                              ? KmainColor
                              : const Color.fromARGB(255, 230, 230, 232),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.female,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          deflutText(text: 'Female'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 230, 232),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    deflutText(text: 'HIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          sliderValue.round().toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'CM',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Slider(
                        activeColor: Colors.blueGrey,
                        // mouseCursor: SystemMouseCursors.alias,
                        min: 100,
                        max: 200,
                        value: sliderValue,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        })
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 232),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      deflutText(text: 'WEIGHT'),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: KmainColor,
                            mini: true,
                            heroTag: 'weight--',
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: KmainColor,
                            mini: true,
                            heroTag: 'weight++',
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 232),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      deflutText(text: ' AGE'),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: KmainColor,
                            mini: true,
                            heroTag: 'age--',
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: KmainColor,
                            mini: true,
                            heroTag: 'age++',
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              text: 'Calulator',
              onpressed: () {
                var result = weight / pow(sliderValue / 100, 2);

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Bmi_result(
                      age: age,
                      weight: weight,
                      height: sliderValue.round(),
                      result: result.round(),
                      isMale: isMale,
                    );
                  },
                ));
              })
        ],
      ),
    );
  }
}
