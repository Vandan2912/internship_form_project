import 'package:flutter/material.dart';
import 'package:form_flutter_app_internship/thirdScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          // _buttonColor = Colors.blueAccent;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black12,
        primary: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),

      // OutlinedButton.styleFrom()
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateController.text = "";
    timeController.text = "";
  }

  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birth details",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range_outlined),
                        labelText: "Date of Birth",
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          print(
                              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          print(
                              formattedDate); //formatted date output using intl package =>  2022-07-04
                          //You can format date as per your need

                          setState(() {
                            dateController.text =
                                formattedDate; //set foratted date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      }),
                  const SizedBox(height: 20),
                  TextField(
                      controller: timeController,
                      decoration: const InputDecoration(
                        labelText: "Time of Birth",
                      ),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );

                        if (pickedTime != null) {
                          print(pickedTime.format(context));
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());
                          print(parsedTime);
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
                          setState(() {
                            timeController.text =
                                formattedTime; //set foratted date to TextField value.
                          });
                          print(formattedTime);
                        } else {
                          print("Time is not selected");
                        }
                      }),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Place of Birth",
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Birth Star",
                    ),
                    isExpanded: true,
                    value: dropdownvalue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Zodiac sign",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Gender"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CustomRadioButton("No", 1),
                      SizedBox(width: 10),
                      CustomRadioButton("Yes", 2),
                      SizedBox(width: 10),
                      CustomRadioButton("Don't know", 3),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThirdScreen()));
                    },
                    child: Text("Next")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
