//profile page
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:campusbuzz/main.dart';
import 'package:campusbuzz/token.dart';
import 'package:campusbuzz/your_Events/yourevent_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';




_launchurl() async {
  var url = Uri.parse(
      "https://docs.google.com/forms/d/e/1FAIpQLScEhcRBVl_z4rjwyrrrBy3wqVcDuxEzx_MOAw-a30qgD5DjwQ/viewform");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Cannot launch URL';
  }
}


 
class Profile extends StatefulWidget {



  const Profile({super.key, });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String DisplayFname = "";
  String DisplayLname = "";
  String DisplayImage = "";
  String imageDownloadUrl = "";



  List<Evvent> events = [];
  


  ImagePicker imagePicker = ImagePicker();



    Future<void> callingProfile() async {
    await profileComponents();
  }




  File? _pickedImageFile;

  void logOutAccount(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const OnboardScreens()));
  }

  final List<String> items = [
    'hello',
    'My Profile',
    'Your Events',
    'Accont Setting',
    'Help Center',
    'Host Your Event',
    'Share',
    'Rate Us',
    'end'
  ];

  Future<void> profileComponents() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? current_user = auth.currentUser;
    if (current_user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("Users")
            .doc(current_user.uid)
            .get();
        // String FetchFname =
        // String FetchLname = userDoc.get("uLname");
        // String FetchImage =

        DisplayFname = userDoc.get("uFname");
        // DisplayLname = FetchLname;
        DisplayImage = userDoc.get("profilePhotoURL");

        // return {
        //   'fname': FetchFname,
        //   'lname': FetchLname,
        //   'image': FetchImage,
        // };
      } catch (e) {
        log("Error of Profile:${e}");
      }
    }
    // return {};
  }


// Map<String,String> profileData = await profileComponents();
  String getFormattedDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy HH:mm');
    return formatter.format(now);
  }


 Future<void> imgUploadToDatabase(XFile? srcImg) async {
    //  final picker = ImagePicker();
    try {
      // final pickedFile = await picker.getImage(source: srcImg);
      User? current_user = FirebaseAuth.instance.currentUser;
      String uidFile = await current_user?.uid ?? "";
      if (srcImg != null) {
        //Adding Image to Firebase Storage
        // Creaing a reference to the directory
        Reference refProfiles =
            FirebaseStorage.instance.ref().child("profiles");

        //Creating file name

        String currentDate = getFormattedDateTime();

        //Creating file reference
        Reference refFile = refProfiles.child("$currentDate $uidFile");

        //Storing the file
        try {
          await refFile.putFile(File(srcImg.path)); //Using File Constructor
        } catch (e) {
          log("Error while Uploading Image: $e");
        }

        //Getting downloadUrl
        imageDownloadUrl = await refFile.getDownloadURL();
      }

      //updting profileLink in Database
      try {
        log("Updating the new Profile Photo Link");
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uidFile)
            .update({'profilePhotoURL': imageDownloadUrl});

        log('Photo URL updated successfully');
      } catch (e) {
        print('Error updating photo URL: $e');
      }

      try {
        setState(() {
          DisplayImage = imageDownloadUrl;
        });
      } catch (e) {
        log("Error while setting up new profile photo: $e");
      }
    } catch (e) {
      // Handle errors, e.g., permission denied
      print('Error picking image: $e');
    }
  }
  
  

  void _pickImage(ImageSource source) async {
    // final pickedImage = await ImagePicker().pickImage(
    XFile? pickedImage = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }



  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  @override
  Widget build(BuildContext context) {
    print("profile page build");
  

  return FutureBuilder(
      future: callingProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while data is being fetched
          return const CircularProgressIndicator(); // You can customize this
        } 
        
        
        else if (snapshot.hasError) {
          // Handle errors
          return Text("Error: ${snapshot.error}");
        } 
        
        
        
        
        else {
          // Data is fetched, build your UI based on the fetched data
              return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (items[index] == 'end') {
                      return Container(
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.noHeader,
                                      animType: AnimType.rightSlide,
                                      title: 'Are you Sure?',
                                      desc: '',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        logOutAccount(context);
                                      },
                                    )..show();
                                  },
                                  child: const Text('Sign Out'))),
                        ),
                      ); // Adjust
                    }
                    if (items[index] == 'hello') {
                      return Container(
                        height: 170,
                        color: const Color(0xfff5f5f5),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 262,
                                child: Container(
                                    width: 100,
                                    height: 100,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(top: 30, left: 15),
                                      child: Text(
                                        "Hi ${DisplayFname}",
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Color(0xffF81B1B),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 7, top: 11),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: const Color.fromARGB(
                                          255, 158, 158, 158),
                                      foregroundImage: _pickedImageFile != null
                                          ? FileImage(_pickedImageFile!)
                                          : null,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                                  // ImageSource imgUploadCam = ImageSource.camera;

                                                  log("Updating Profile Photo using Camera");
                                                  XFile? uploadedImg =
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                  await imgUploadToDatabase(
                                                      uploadedImg);
                                                },
                                          child: Container(
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                      onTap: () async {
                                                // await imgUploadviaGallery();
                                                log("Updating Profile Photo using Gallery");
                                                XFile? uploadedImg =
                                                    await imagePicker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                await imgUploadToDatabase(
                                                    uploadedImg);
                                              },
                                        child: Container(
                                          child: const Icon(
                                            Icons.image,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    if (items[index] == 'Help Center') {
                      // Add a sized box after the "Help Center" list item
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: ListTile(
                                title: Text(items[index],
                                    style: const TextStyle(fontSize: 20)),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Help()),
                                  );
                                }),
                          ),
                          Container(
                            height: 70,
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.25)),
                          ), // Adjust the height as needed
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: ListTile(
                              title: Text(
                                items[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyProfile()),
                                    );
                                    break;
                                  case 1:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Orders()),
                                    );
                                    break;
                                  case 2:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => YourEvents(events: events,)),
                                    );
                                    break;
                                  case 3:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Help()),
                                    );
                                    break;
                                  case 4:
                                    break;
                                  case 5:
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => const Share()),
                                    _launchurl();

                                    break;
                                  case 6:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Rate()),
                                    );
                                    break;
                                  // Repeat for other cases
                                  default:
                                    break;
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  })),
        ],
      ),
    );
        }




  }
  
);
}
}
//profile page details

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('order'),
      ),
    );
  }
}

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('help'),
      ),
    );
  }
}

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('offer'),
      ),
    );
  }
}

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('share'),
      ),
    );
  }
}

class Rate extends StatelessWidget {
  const Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Rate'),
      ),
    );
  }
}
