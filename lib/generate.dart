import 'package:flutter/material.dart';
import 'package:get_invoice/pdff.dart';
import 'mapp.dart';

class generate extends StatefulWidget {
  String Name;
  String Email;
  String phoneno;
  String CompanyName;
  String postalcode;
  String Address;

  generate(
      {required this.Address,
      required this.postalcode,
      required this.CompanyName,
      required this.Name,
      required this.phoneno,
      required this.Email,
      Key? key})
      : super(key: key);

  @override
  State<generate> createState() => _generateState();
}

class _generateState extends State<generate> {
  TextEditingController item = TextEditingController();
  TextEditingController Rate = TextEditingController();
  TextEditingController quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Generate Invoice",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pdfff(
                            items: [],
                            Address: widget.Address,
                            Name: widget.Name,
                            CompanyName: widget.CompanyName,
                            phoneno: widget.phoneno,
                            postalcode: widget.postalcode),
                      ));
                },
                child: Icon(
                  Icons.done,
                  size: 20,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Client - ",
                    style: TextStyle(color: Colors.black38, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.Name,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Email - ",
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                  ),
                  Text(
                    widget.Email,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Rate", style: TextStyle(fontSize: 20)),
                  Text("Quantity", style: TextStyle(fontSize: 20))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: item,
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: Rate,
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: quantity,
                  )),
                ],
              ),
              Container(
                height: 400,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item - ${items[index]['itemm']}"),
                          Text(
                              "Total rate - ${int.parse(items[index]['Rate']) * int.parse(items[index]['quantity'])}")
                        ],
                      ),
                      subtitle: Text("Quantity -${items[index]['quantity']}"),
                    );
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items.add({
                        'itemm': item.text,
                        'Rate': Rate.text,
                        'quantity': quantity.text
                      });
                      item.clear();
                      Rate.clear();
                      quantity.clear();
                    });
                  },
                  child: Text("Add Item"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
