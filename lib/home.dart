import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:http/http.dart';
import 'package:mycrypto/adduser/adduser.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var _icon = Icons.light_mode_outlined;

  var _getJson=[];
   

   final Url = "https://jsonplaceholder.typicode.com/posts/1/comments";

  void MyCrypto() async{
    try{

      final response = await get(Uri.parse(Url));
    
      final jsonData =  json.decode(response.body) as List;

      setState(() {
        _getJson= jsonData;
      });
    }catch(err){
    }
  }

  @override
  void initState() { 
    super.initState();
    MyCrypto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
   appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, 
        icon: Icon(Icons.list_outlined)),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset('assets/logo/logo1.png',height: 60,width: 60,),
                  Text(
                    'myCrypto',
                    style: TextStyle(
                    fontSize: 20
                    )
                  )
                ],
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
            icon: Icon(
              _icon,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                if (_icon == Icons.dark_mode_outlined) {
                  _icon = Icons.light_mode_outlined;
                  // set ThemeMode=true;
                  
                } else {
                  _icon = Icons.dark_mode_outlined;
                 
                }
                
              });
            },
          ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
                  ],
                )
                )
          ],
        ),
        
        
      ),
      body: Container(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          
          itemCount: _getJson.length,
          itemBuilder: (context,index) {
            final post = _getJson[index];
          return Container(
            margin: EdgeInsets.only(top: 20,left: 10,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: Card(
              child: ListTile(
                leading: Text("${post["postId"]}",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                )),
                title: Text("${post["name"]}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
                ),
                subtitle: Text("${post["body"]}"),
                trailing: Text("${post["id"]}"),
                ),
            ),
            
          );
         },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser(),));
        },
        child: Icon(Icons.add_outlined),
        ),
    );
  }
}