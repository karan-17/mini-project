import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final content = [
    {
      'text': 'Welcome to SIMLOCK, Let\'s Shop',
      'image': 'assets/images/splash_1.png',
    },
    {
      'text': 'We help people connect with store around India',
      'image': 'assets/images/splash_2.png',
    },
    {
      'text': 'We show the easy way to shop\nJust stay at home with us',
      'image': 'assets/images/splash_3.png',
    },
  ];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Spacer(),
                  FittedBox(
                    child: splashHeadingText(
                      content[index]['text'].toString(),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.6) * 0.5,
                    child: Image.asset(content[index]['image'].toString()),
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 6,
              width: pageIndex == 0 ? 16 : 6,
              decoration: BoxDecoration(
                color: pageIndex == 0 ? Color(0xff374ABE) : Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 5),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 6,
              width: pageIndex == 1 ? 16 : 6,
              decoration: BoxDecoration(
                color: pageIndex == 1 ? Color(0xff374ABE) : Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 5),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 6,
              width: pageIndex == 2 ? 16 : 6,
              decoration: BoxDecoration(
                color: pageIndex == 2 ? Color(0xff374ABE) : Colors.grey,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget splashHeadingText(String text) {
  return Column(
    children: [
      ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff374ABE),
            Color(0xff3DB2FF),
          ],
        ).createShader(rect),
        child: Text(
          'SIMLOCK',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color(0xff374ABE),
            fontFamily: 'Muli',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Muli',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
