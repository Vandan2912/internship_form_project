import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'second.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = 'Myself';

  var items = [
    'Myself',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  int value = 0;
  Color _buttonColor = Colors.white;
  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          // _buttonColor = Colors.blueAccent;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: _buttonColor,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Creating profile for"),
                  DropdownButton(
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
                  const SizedBox(height: 50),
                  const Text("Full name (As per Govt ID)"),
                  TextField(),
                  const SizedBox(height: 50),
                  const Text("Gender"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CustomRadioButton("Male", 1),
                      SizedBox(width: 10),
                      CustomRadioButton("Female", 2),
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
                              builder: (context) => SecondScreen()));
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
