import 'package:miniproject/main.dart';
import 'package:miniproject/DATA.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';




class CustomDialog extends StatelessWidget {
  final String title, description;

  CustomDialog({
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text('Okay'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final formkey1= GlobalKey<FormState>();
  final databaseReference = FirebaseDatabase.instance.reference();

  void createData(){
    databaseReference.child(newdata.rollno).set({
      'name':newdata.name,
      'parent name':newdata.parentname,
      'year':newdata.year,
      'programme':newdata.programme,
      'branch':newdata.branch,
      'academicyear':newdata.academicyear,
      'rollno':newdata.rollno,
      'email':newdata.email,
      'purpose':newdata.purpose,

    });

  }

  Data newdata=Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BONAFIDE'),
      ),
      body: Form(
        key: formkey1,
        child: ListView(
          children: [
            TextFormField(
                decoration: const InputDecoration(
                  labelText: 'NAME',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.name=value;
                }

            ),
            TextFormField(
                decoration: const InputDecoration(
                  labelText: 'PARENT NAME',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.parentname=value;
                }
            ),
            TextFormField(

                decoration: const InputDecoration(
                  labelText: 'YEAR',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.year=value;
                }
            ),
            TextFormField(

                decoration: const InputDecoration(
                  labelText: 'PROGRAMME',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.programme=value;
                }
            ),
            TextFormField(

                decoration: const InputDecoration(
                  labelText: 'DISCIPLINE',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.branch=value;
                }
            ),
            TextFormField(

                decoration: const InputDecoration(
                  labelText: 'ACADEMIC YEAR',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.academicyear=value;
                }
            ),
            TextFormField(

                decoration: const InputDecoration(
                  labelText: 'ROLL NO',
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },
                onSaved: (String value ){
                  newdata.rollno=value;
                }
            ),
            TextFormField(

                decoration: const InputDecoration(
                  labelText: 'PURPOSE',
                ),
                onSaved: (String value ){
                  newdata.purpose=value;
                },
                validator: (String value){
                  if(value.isEmpty){
                    return 'no data';
                  }
                  return null;
                },

            ),
            TextFormField(

              decoration: const InputDecoration(
                labelText: 'EMAIL',
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: ( String value ){
                newdata.email=value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  if(formkey1.currentState.validate()) {
                    formkey1.currentState.save();
                    print(newdata.purpose);
                    createData();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Success",
                        description:
                        "You will recieve mail in 2-3 working days",
                      ),
                    );

                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Failed",
                        description:
                        "Try again later",
                      ),
                    );


                  }
                },
                child: Text('SUBMIT'),
              ),
            )
          ],
        ),
      ),

    );

  }
}
