import 'package:flutter/material.dart';

class UiComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("UI Component"),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: <Widget>[
            Positioned(
              top: 130,
              left: 80,
              child: Container(
                width: 280,
                height: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(150),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color(0xfffda791),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        'Breakfast',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Bread,',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Peanut butter,',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Apple',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '525 ',
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Kcal',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 67,
              top: 70,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white30.withOpacity(0.5),
                ),
                child: Image.asset('assets/breakfast.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
