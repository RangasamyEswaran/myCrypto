import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mycrypto/adduser/jsoninput.dart';
import 'package:mycrypto/home.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController subnamecontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();

  Dio dio = new Dio();

  Future<Album> postData(String name, String subname, String id) async {
    dynamic data = {'title': name, 'body': subname, 'userId': id};
    final String pathUrl = 'https://jsonplaceholder.typicode.com/posts';
    var responce = await dio.post(pathUrl,
        data: data,
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }));
    return responce.data;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add User'),
        ),
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Text(
                      'Enter Title',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Container(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            controller: idcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter here',
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Text(
                      'Enter Title',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Container(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            controller: namecontroller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Enter here',
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Text(
                      'Enter SubTitle',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ListTile(
                        leading: Icon(Icons.description_outlined),
                        title: Container(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            controller: subnamecontroller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Enter here',
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 75,
                    child: InkWell(
                      onTap: () async {
                        print('Posting..');
                        final String name = namecontroller.text;
                        final String subname = subnamecontroller.text;
                        final String id = idcontroller.text;

                        await postData(name, subname, id)
                            .then((value) => print(value));
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      // Handle your callback
                      child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.blueAccent,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 150,
                                  bottom: 25,
                                  child: Text(
                                    'Submite',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          )),
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
