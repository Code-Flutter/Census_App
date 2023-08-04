import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(), // Faint and continuously magnifying background
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TyperAnimatedTextKit(
                    isRepeatingAnimation:
                        false, // Set to false to run only once
                    text: ["THE UGANDA NATIONAL CENSUS 2025"],
                    textStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily:
                          'Roboto', // Replace with your custom font name
                    ),
                    speed: Duration(
                        milliseconds: 200), // Adjust the speed as needed
                    textAlign: TextAlign.center, // Center align the text
                  ),
                  SizedBox(height: 20),
                  _buildCensusBox(),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   child: _buildContactInfo(),
          // ),
        ],
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Adjust the duration as needed
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        // Use Tween to create a smooth transition between the original and magnified scale
        final scale = 1.0 + (_animationController.value * 0.2);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/Emblem.png'), // Replace with your background image path
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(
                    0.2), // Adjust the opacity (0.0 to 1.0) for faintness
                BlendMode.dstATop,
              ),
            ),
          ),
          transform: Matrix4.identity()..scale(scale),
        );
      },
    );
  }
}

Widget _buildCensusBox() {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(
          0.8), // Set the background color to white with 80% opacity
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
    child: Column(
      children: [
        Text(
          "About the Census",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "The Uganda National Census is a comprehensive population and housing census conducted every ten years to gather information about the population, housing conditions, and other socio-economic data of Uganda.",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "The last census was conducted in 2014, and it plays a crucial role in providing accurate and up-to-date data for government planning, resource allocation, and policy formulation.",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "The upcoming census in 2025 aims to provide essential data to support the country's development initiatives and ensure the well-being of all Ugandans.",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
        // _buildContactInfo()
      ],
    ),
  );
}

Widget _buildContactInfo() {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(
          0.5), // Set the background color to black with 50% opacity
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildContactLine("For more information, please contact"),
        _buildContactLine("www.nira.org"),
        _buildContactLine("nira@gmail.com"),
        _buildContactLine("Toll-Free Line: 0800446789"),
      ],
    ),
  );
}

Widget _buildContactLine(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
