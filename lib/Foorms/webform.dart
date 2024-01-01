import 'package:flutter/material.dart';

class FormScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen1> {
   List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
   List<String> itemsS = [
    'cultural',
    'techniqal',
    'sports',
    'hackethon',
    'dance',
  ];
  String drpValue ='cultural';
  String dropdownValue = '1';
  String _Location='';
  String _EVName='';
  String _Leader='';
  String _CLGNAME='';
  String _EventTITLE='';
  String _DESCRIPTION='';
 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLocation() {
    return Column(
      children: [
      const Padding(
           padding:  EdgeInsets.only(right:27.0,bottom: 5),
           child: Row(
             children: [
               Text("Location",
               style: TextStyle(fontSize: 20),),
                 Text("*",
               style: TextStyle(fontSize: 20,color:Colors.red),),
             ],
           ),
         ),
     TextFormField(
      
      decoration: InputDecoration(
        
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'address',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _Location = value??'';
      },
    ),
      ]
    );
  }
  

  Widget _buildEVNAME() {
     return
     Column(
      children:[ 
        Padding(
          padding: const EdgeInsets.only(right: 27,bottom: 5),
          child: Row(
            children: [
              Text('Event Name',style: TextStyle(fontSize: 20),),
               Text('*',style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
        ),
        TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter Event Name',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        _EVName = value??'';
      },
    )]
     );
   
  }

  Widget _buildLeader() {
    return Column( 
      children:[
         Padding(
          padding: const EdgeInsets.only(right: 22,bottom: 5),
          child: Row(
            children: [
              Text("Team Leader",style: TextStyle(fontSize: 20),),
                Text("*",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
        ),

     TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter your Name',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _Leader = value??'';
      },
    ),
      ]
    );
  }
  

  Widget _buildCLGNAME() {
    return Column(
      children:[
         Padding(
          padding: const EdgeInsets.only(right: 21,bottom: 5),
          child: Row(
            children: [
              Text("College Name",style: TextStyle(fontSize: 20),),
               Text("*",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
        ),
    TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter Collage Name',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _CLGNAME = value??'';
      },
    )]
    );
  }

  Widget _buildEVENTTITLE() {
     return Column(
      children:[
        Padding(
          padding: const EdgeInsets.only(right: 24,bottom: 5),
          child: Row(
            children: [
              Text("EVENT TITLE",style: TextStyle(fontSize: 20),),
                Text("*",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
        ),
      TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: 'Enter THE NAME',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
       keyboardType: TextInputType.phone,
      maxLength: null,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Number is requierd';
        }

        return null;
      },
      onSaved: (String? value) {
        _EventTITLE = value??'';
      },
    )
      ]
     );
  }
   Widget _buiLdDESCRIPTION() {
     return Column( 
      children:[
         Padding(
          padding: const EdgeInsets.only(right: 20,bottom: 5),
          child: Row(
            children: [
              Text("DESCRIPTION",style: TextStyle(fontSize: 20),),
               Text("*",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
        ),
     TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5)
        ),
        hintText: '       brief description...............    ',
        hintStyle:TextStyle(color: Colors.grey,),
        filled: true
      ),
      maxLength: null,
      maxLines: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'requierd';
        }

        return null;
      },
      onSaved: (String? value) {
        _DESCRIPTION = value??'';
      },
    )
    ]
    );
  }
   Widget _builddropdownbox() {
     return  Column(
       children: [ const Row(
            children: [
              Text("Team Size",style: TextStyle(fontSize: 20),),
               Text("*",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
      
         Container(
          decoration: BoxDecoration(
            color: Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(5.5)
          ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
            
                value: dropdownValue,
                isExpanded: true,
            
                borderRadius: BorderRadius.circular(5.5),
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
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

   Widget _buildCategories() {
     return  Column(
       children: [ const Row(
            children: [
              Text("Categories",style: TextStyle(fontSize: 20),),
               Text("*",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
      
         Container(
          decoration: BoxDecoration(
            color: Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(5.5)
          ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
            
                value: drpValue,
                isExpanded: true,
            
                borderRadius: BorderRadius.circular(5.5),
                items: itemsS.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    drpValue = newValue ?? '';
                  });
                },
              ),
            ),
          ),
       ],
     );
   } 



 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
      backgroundColor: Colors.white,
      elevation: 0,
       iconTheme:const IconThemeData(
    color: Colors.black, //change your color here
  ),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 _buildCLGNAME(),
                SizedBox(height: 15),
                  _buildLocation(),
                  SizedBox(height: 10,),
                    SizedBox(height: 60,
                    width: 500,
                    
                    child: Container(
                      width: 400,
                      height: 100,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('             Event details',style: TextStyle(fontSize: 30),),
                      )),),
                      SizedBox(height: 20,),
                _buildEVNAME(),
                  SizedBox(height: 15),
                    _buildEVENTTITLE(),  
                  SizedBox(height: 15),
               
                  SizedBox(height: 15),
                     _buiLdDESCRIPTION(),
                SizedBox(height: 15),
                  _buildCategories(),
                SizedBox(height: 15),
                 _builddropdownbox(), 
                SizedBox(height: 50),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MaterialButton(
                  color: Color(0xff112031),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                if (!_formKey.currentState!.validate()) {
                   return;
                }

                 _formKey.currentState?.save();
                    
                   print(_CLGNAME);
                   print(_Location);
                   print(_EVName);
                   print(_EventTITLE);
                   print(_Leader);
                  
                   print(_DESCRIPTION);
                   print(dropdownValue);
                   print(drpValue);
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
                ),),
                // ElevatedButton(
                //   child: const Text(
                //     'Submit',
                //     style: TextStyle(color: Colors.white, fontSize: 16),
                //   ),
                //   onPressed: () {
                //     if (!_formKey.currentState!.validate()) {
                //       return;
                //     }

                //     _formKey.currentState?.save();
                    

                //     print(_name);
                //     print(_email);
                //     print(_phoneNumber);
                //      print(_Leader);
                //     print(_CLGNAME);
                
                //      print(_AboutAbstract);
                //   print(dropdownValue);
                

                //     //Send to API
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}