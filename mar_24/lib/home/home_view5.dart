import 'package:flutter/material.dart';

// Images: Asset & Network
class HomeView5 extends StatelessWidget {
  const HomeView5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Asset Image"),
              Image(
                width: 200,
                height: 200,
                image: AssetImage("assets/images/my_image.png"),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/my_image.png"),
                    // image: NetworkImage("...image url..."),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(height: 20),
              Text("Network Image"),
              Image(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvf9vNu_LAodIi8YjScoL_fsuRpkSEHpCsGw&s",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
