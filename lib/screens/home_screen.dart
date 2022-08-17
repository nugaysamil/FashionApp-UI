import 'dart:math';

import 'package:fashionapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';
import 'details.dart';

void main() {
  runApp(const MyApp());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.85);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            child: Text(
              'Find your style',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/menu.svg',
              width: 35,
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/bag.svg',
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 10),
                height: 150,
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: <Widget>[
                    Container(
                      height: 160,
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.all(7),
                        scrollDirection: Axis.horizontal, //soldan sağa
                        children: <Widget>[
                          Center(
                            child: Container(
                                child: Column(children: [
                              listeElemani('assets/model.png'),
                              Text(
                                'women',
                                style: GoogleFonts.montserrat(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                              )
                            ])),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Center(
                            child: Container(
                                child: Column(children: [
                              listeElemani('assets/model2.png'),
                              Text(
                                'man',
                                style: GoogleFonts.montserrat(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                              )
                            ])),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Center(
                            child: Container(
                                child: Column(children: [
                              listeElemani('assets/model3.jpg'),
                              Text(
                                'children',
                                style: GoogleFonts.montserrat(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                              )
                            ])),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Center(
                            child: Container(
                                child: Column(children: [
                              listeElemani('assets/model2.png'),
                              Text(
                                'women',
                                style: GoogleFonts.montserrat(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                              )
                            ])),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(height: 10),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: 0.85,
                  child: PageView.builder(
                      itemCount: dataList.length,
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        FractionallySizedBox(widthFactor: 0.5);
                        return carouselView(index);
                      }),
                ))
          ],
        ));
  }

  Widget listeElemani(String imagePatch) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 90,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), //overleştirmek
                  image: DecorationImage(
                      image: AssetImage(imagePatch), fit: BoxFit.cover)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.45).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Hero(
            tag: data.imageName,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(data: data)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(
                          data.imageName,
                        ),
                        fit: BoxFit.fill),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black26)
                    ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            data.title,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\$${data.price}",
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
