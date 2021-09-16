import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController name = TextEditingController();
  TextEditingController subname = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 50,top: 20 ),
            child: Text('Enter Title',
            style: TextStyle(
              
              fontSize: 20
            ),
            ),
            ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),

                child: ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Container(
                    child: TextField(
                  style: TextStyle(
                    fontSize: 20
                  ),
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    
                  ),
                ),
                  ),
                )
              ),
              Padding(padding: EdgeInsets.only(left: 50,top: 20 ),
            child: Text('Enter SubTitle',
            style: TextStyle(
              
              fontSize: 20
            ),
            ),
            ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Container(
                    child: TextField(
                  style: TextStyle(
                    fontSize: 20
                  ),
                  controller: subname,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    
                  ),
                ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}