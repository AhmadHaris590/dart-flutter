import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DestinationPage(),
    );
  }
}

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B132B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Top Image Section
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1501785888041-af3ef285b470",
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Title
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Lago di Braies",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Back Button
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),

                  /// Share Button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(Icons.share, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// Info Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoCard(Icons.location_on, "120 km"),
                  infoCard(Icons.access_time, "2.5 hrs"),
                  infoCard(Icons.attach_money, "\$45.00"),
                ],
              ),

              SizedBox(height: 25),

              /// Overview Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overview",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Experience the heart of the Dolomites. "
                      "Lago di Braies is one of the most beautiful lakes in South Tyrol, Italy. "
                      "Famous for its crystal clear emerald waters and the impressive mountain "
                      "backdrop of the Seekofel.",
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white54, size: 18),
                        SizedBox(width: 5),
                        Text(
                          "South Tyrol, Italy",
                          style: TextStyle(color: Colors.white54),
                        )
                      ],
                    ),

                    SizedBox(height: 40),

                    /// Book Button
                    Container(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Book Now",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Center(
                      child: Text(
                        "View Terms and Conditions",
                        style: TextStyle(
                          color: Colors.white54,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Info Card Widget
  Widget infoCard(IconData icon, String text) {
    return Container(
      width: 90,
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF1C2541),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}