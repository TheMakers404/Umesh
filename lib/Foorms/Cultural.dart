import 'package:campusbuzz/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cultural extends StatefulWidget {
  const Cultural({super.key, required this.imageUrl, required this.time, required this.date, required this.title, required this.college_name, required this.id});

    final String imageUrl;
  final String time;
  final String date;
  final String title;
  final String college_name;

  final String id;

  @override
  State<Cultural> createState() => _CulturalState();
}

class _CulturalState extends State<Cultural> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  var globalDrop1 = "";
  var globalDrop2 = "";
  List<String> participantNames = [];
  int selectedIndex = 0;
  String _College = '';
  String _Name = '';
  String _email = '';
  String _Number = '';
  String _Roll = '';
  List<String> items = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];
  List<String> items2 = [
    'CSE',
    'AIML',
    'EEE',
    'CIVIL',
  ];
  String dropdownValue = '1st Year';
  String dropdownValue1 = 'CSE';

  Widget _buildName() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter THE NAME',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _Name = value ?? '';
        },
      )
    ]);
  }

  Widget _buildRoll() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "Roll No",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Roll No',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _Roll = value ?? '';
        },
      )
    ]);
  }

  Widget _buildCollegeM() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "College Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter THE NAME',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _College = value ?? '';
        },
      )
    ]);
  }

  Widget _buildMOBILENM() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 5),
        child: Row(
          children: [
            Text(
              "Mobile No",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter your Number',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        keyboardType: TextInputType.phone,
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Number is requierd';
          }

          return null;
        },
        onSaved: (String? value) {
          _Number = value ?? '';
        },
      )
    ]);
  }

  Widget _buildMailID() {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(right: 27, bottom: 5),
        child: Row(
          children: [
            Text(
              'Email ID',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '*',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            hintText: 'Enter Mail Id',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true),
        maxLength: null,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }
          if (!RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                  r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                  r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                  r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                  r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                  r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                  r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String? value) {
          _email = value ?? '';
        },
      )
    ]);
  }

  Widget _builddropdown1() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Year",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(5.5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              value: dropdownValue,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5.5),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue ?? '';
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _builddropdown2() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Branch",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(5.5)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              value: dropdownValue1,
              isExpanded: true,
              borderRadius: BorderRadius.circular(5.5),
              items: items2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue ?? '';
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _builddropdownbox() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "List of sports",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "*",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 5),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Event').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            //using snapshot

            var umeshDoc = snapshot.data!.docs
                .firstWhere((doc) => doc.id == widget.id);
            var sportNames = umeshDoc['sportNames'] as List<dynamic>;
            var entryFee = umeshDoc['entry fee'] as List<dynamic>;
            var participants = umeshDoc['participantCounts'] as List<dynamic>;
            int drop = participants[selectedIndex];

            var drop1 = entryFee[selectedIndex];
            var drop2 = sportNames[selectedIndex];

            globalDrop1 = drop1;
            globalDrop2 = drop2;

            print("--------------------------------------------------------");

            print(drop1);

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //dropdownbox
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: DropdownButton<int>(
                      underline: const SizedBox(),
                      value: selectedIndex,
                      hint: const Text('Select a sport'),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(5.5),
                      items: List.generate(sportNames.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(sportNames[index].toString()),
                        );
                      }),
                      onChanged: (int? index) {
                        if (index != null) {
                          setState(() {
                            selectedIndex = index;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                    'Entry Fee: ${entryFee.length > selectedIndex ? entryFee[selectedIndex] : ""}'),
                const SizedBox(height: 20),
                Text(
                    'Max Participants: ${participants.length > selectedIndex ? participants[selectedIndex] : ""}'),

                _builddropdownbox1(drop),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _builddropdownbox1(int participants) {
    //  print(participants);
    return Column(
      children: [
        const SizedBox(height: 15),
        _buildDynamicTextFields(participants),
      ],
    );
  }

  Widget _buildDynamicTextFields(int numberOfFields) {
    List<Widget> textFields = [];
    print("arrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(numberOfFields);

    for (int i = 0; i < numberOfFields; i++) {
      textFields.add(
        TextFormField(
          // controller:data8 ,
          controller: TextEditingController(),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            // hintText: 'Enter THE NAME',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true,
            labelText: 'Participant ${i + 1} Name',
            labelStyle: const TextStyle(
              color: Color.fromARGB(
                  255, 106, 105, 105), // Change this to your desired color
              // Other text style properties can be added here
            ),
          ),
          onSaved: (String? value) {
            participantNames.add(value!);
            // Handle the participant's name as needed
          },
        ),
      );
      textFields.add(const SizedBox(height: 15));
    }

    return Column(children: textFields);
  }

  Widget build(BuildContext context) {
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection('Test12');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Demo",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15),
                _buildName(),
                const SizedBox(height: 10),
                _buildMOBILENM(),
                const SizedBox(
                  height: 15,
                ),
                _buildMailID(),
                const SizedBox(height: 15),
                _buildCollegeM(),
                const SizedBox(height: 15),
                _buildRoll(),
                const SizedBox(height: 15),
                _builddropdown1(),
                const SizedBox(height: 15),
                _builddropdown2(),
                const SizedBox(height: 15),
                _builddropdownbox(),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MaterialButton(
                    color: const Color(0xff112031),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      _formKey.currentState?.save();
                      await eventsCollection.add({
                        'College Name': _College,
                        'Name': _Name,
                        'Mail Id': _email,
                        'Mobile No': _Number,
                        'Year': dropdownValue,
                        'Branch': dropdownValue1,
                        'Roll No': _Roll,
                        'subevents': globalDrop1,
                        'entryfee': globalDrop2,
                        "team members": participantNames,
                      });

                      _formKey.currentState?.reset();

                      participantNames.clear();
                      Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TokenDisplayScreen(event: Evvent(token: "token", imageUrl: widget.imageUrl, time: widget.time, date: widget.date, title: widget.title, leaderName:_Name, college_name: widget.college_name, College_Name: "widget.College_Name", Name: "widget.Name", Mail_Id: "Mail_Id", Mobile_No: "Mobile_No", Year: "Year", Branch: "Branch", amount: 1),),
            ),
          );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register Now",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white),
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
      ),
    );
  }
}
