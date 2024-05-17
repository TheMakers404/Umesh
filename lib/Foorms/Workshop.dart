import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Workshop extends StatefulWidget {
  const Workshop({super.key});

  @override
  State<Workshop> createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
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
        keyboardType: TextInputType.phone,
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
        keyboardType: TextInputType.phone,
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
        keyboardType: TextInputType.phone,
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

  Widget build(BuildContext context) {
    CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection('Test12');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WorkShop",
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
                // const SizedBox(height: 15),
                // _builddropdown2(),
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
                      });

                      _formKey.currentState?.reset();
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
