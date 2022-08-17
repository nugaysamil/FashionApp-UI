import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var list = ['S', 'M', 'L', 'XL', 'XXL'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: widget.data.imageName,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.data.imageName,
                      ),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black26)
                    ]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                widget.data.title,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Price \$${widget.data.price}",
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                // ignore: unnecessary_const
                child: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 25.0,
                  textDirection: TextDirection.ltr,
                  semanticLabel: 'Icon',
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 10, 5),
                child: const SizedBox(
                  height: 50,
                ),
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    '4.8',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '(2.6+ review)',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(50, 0, 10, 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Text(
                          "Select Size",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.fromLTRB(50, 10, 0, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black38)),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      'S',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black38)),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      'M',
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black38)),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      'X',
                    ),
                  ),
                ),
              ),
            ],
            //------------------------------------------------
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Text(
                          "Select Color",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            //-----------------------------------------------
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                color: Colors.red,
                margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black38)),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '',
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.orange,
                margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black38)),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '',
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black38)),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      '',
                    ),
                  ),
                ),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              // Respond to button press
            },
            child: Text("Add card or/ Add to cart"),
          )
        ],
      ),
    );
  }
}
