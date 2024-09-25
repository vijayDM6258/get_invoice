import 'package:flutter/material.dart';
import 'generate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hello(),
    );
  }
}

class hello extends StatefulWidget {
  hello({Key? key}) : super(key: key);

  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phno = TextEditingController();
  TextEditingController CompanyName = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController postalcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Client invormation",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full Name"),
              TextFormField(
                controller: Name,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Email"),
              TextFormField(
                controller: Email,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Phone NUmber"),
              TextFormField(
                controller: Phno,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Company Name"),
              TextFormField(
                controller: CompanyName,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Address"),
              TextFormField(
                controller: Address,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Town/postal Code"),
              TextFormField(
                controller: postalcode,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => generate(
                                  Name: Name.text,
                                  Email: Email.text,
                                  Address: Address.text,
                                  CompanyName: CompanyName.text,
                                  phoneno: Phno.text,
                                  postalcode: postalcode.text),
                            ));
                      },
                      child: Text("Save Client")))
            ],
          ),
        ),
      ),
    );
  }
}
