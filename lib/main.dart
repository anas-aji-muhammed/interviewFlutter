import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,

      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: uname,
              decoration: InputDecoration(
                  labelText: 'Enter User Name'
              ),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: 'Enter Password'
              ),
            ),
            Builder(
              builder:(context) => FlatButton(
                onPressed: (){
                  if(uname.text == 'Test' && pass.text == 'Test'){
                    print("Okay");
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Username and Password Okay")));
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage()));

                  }
                  if(uname.text.isEmpty || pass.text.isEmpty){
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Enter all fields")));
                        print("Type something");
                  }
                  if(uname.text != 'Test' && pass.text != 'Test'){
                    print("Okay");
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Username or Password Wrong")));
                  }


                },
                child: Text("Login"),
                color: Colors.blue,
              ),
            )


          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interview"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Name",
              style: TextStyle(
                fontSize: 30.00,
                letterSpacing: 2.0,
              ),),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.00,
                    width: 150.00,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.0,
                    width: 150.00,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150.0,
                    width: 150.00,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,

                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

