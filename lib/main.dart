import 'package:campusbuzz/FavProv.dart';
import 'package:campusbuzz/event_list.dart';
import 'package:campusbuzz/nav.dart';
import 'package:campusbuzz/provider/banner.dart';
import 'package:campusbuzz/provider/ymodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'createaccount.dart';
import 'firebase_options.dart';
import 'welcomeback.dart';


void main() async {
  

  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  //runApp(MaterialApp(home:OnboardApp()));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((fn) {
    runApp(
    // ProviderScope(
    //   child: 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventListNotifier(), ),
        ChangeNotifierProvider(create: (context) => BannerProvider(),),
        ChangeNotifierProvider(
      create: (context) => LikedEventsProvider(),)

      ],
        
        child:FutureBuilder(
        future:
            gettingData(), // Assuming gettingData returns a Future<List<Event>>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            
            // Data retrieval is complete, build the app
            //         return MaterialApp(
            //   title: 'Your App Title',
            //   home: TabsScreen(),
            // );
      return 
       
        (const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:TabsScreen()
          )
          );
     
    
          } else if (snapshot.hasError) {
            // Error occurred while fetching data
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text("Error fetching data: ${snapshot.error}"),
                ),
              ),
            );
          } else {
            // Data retrieval is in progress, show a loading indicator
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    // ),
    ),
  );
  });
  
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => EventLikeNotifier(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Campusbuzz',
//         home: TabsScreen(),
//       ),
//     );
//   }
// }






class OnboardApp extends StatefulWidget {
  const OnboardApp({super.key});

  @override
  State<OnboardApp> createState() => _OnboardAppState();
}

class _OnboardAppState extends State<OnboardApp> {
  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Campus Buzz',
        theme: ThemeData(primaryColor: Colors.black12),
        // home: (FirebaseAuth.instance.currentUser != null)
        //     ? Home()
        //     : WelcomeBackScreen(),
            home:(FirebaseAuth.instance.currentUser != null) ? const TabsScreen():const OnboardScreens()
      
      );
    
  }
}

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});

  @override
  _OnboardScreensState createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardPage> _pages = [
    const OnboardPage(
      imageUrl: 'assets/images/dj.png',
      title: "Welcome to CampusBuzz!",
      description:
          "Unleash Your Skills: Explore a World of Events, Where Learning and Fun Converge.",
      descriptionTextColor: Colors.grey,
      bgColor: Color.fromARGB(126, 255, 255, 255),
      highlightedWord: "Skills",
      highlightedWordTextColor: Colors.blueGrey,
    ),
    const OnboardPage(
      imageUrl: 'assets/images/comp.png',
      title: "Rise to the Challenge!",
      description:
          "Enter the Arena of Competitions and Triumphs. Showcase your skills, seize victory, and celebrate excellence with CampusBuzz.",
      descriptionTextColor: Colors.grey,
      bgColor: Color.fromARGB(126, 255, 255, 255),
      highlightedWord: '',
    ),
        OnboardPage(
      imageUrl: 'images/yt.png',
      ttitle: Text(
  'FINDING OUT EVENTS IS ${const TextSpan(text: 'EASIER', style: TextStyle(color: Colors.red))} THAN YOU THINK!',
),
      title: "FINDING OUT EVENTS IS EASIER THAN YOU THINK!",
      rchtitle: RichText(
  text: const TextSpan(
    style: TextStyle(
      fontFamily: 'Inter',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    children: [
      TextSpan(
        text: 'FINDING OUT EVENTS IS ',
      ),
      TextSpan(
        text: 'EASIER',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      TextSpan(
        text: ' THAN YOU THINK!',
      ),
    ],
  ),
),

      description: "Unlock Exciting Events with Ease!",
      // descriptionTextColor: Color.fromARGB(192, 8, 8, 7),
      descriptionTextColor: Colors.grey,
      descriptionHighlightedTextColor: const Color.fromARGB(255, 15, 14, 14),
      bgColor: const Color.fromARGB(126, 255, 255, 255),
      elevation: 0,
      showButtons: true,
      highlightedWord: 'EASIER',
      highlightedWordTextColor: Colors.red, // Red color for EASIER
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _currentPage <= 1
            ? const Color.fromARGB(126, 255, 255, 255)
            : const Color.fromARGB(126, 255, 255, 255),
        title: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Campus',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xFF112031),
                  ),
                ),
                TextSpan(
                  text: 'Buzz',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xFFE93030),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          if (_currentPage < _pages.length - 1)
            Container(
              margin: const EdgeInsets.only(right: 12.0),
              child: TextButton(
                onPressed: () {
                  _pageController.jumpToPage(_pages.length - 1);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(126, 255, 255, 255),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _pages[index],
                    if (_pages[index].showButtons && index == 2)
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          _buildGetStartedButton(context),
                          const SizedBox(height: 20),
                          _buildSignInButton(context),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
          if (_currentPage != _pages.length - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: _buildPageIndicator(),
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF112031),
                      elevation: 0.0,
                      onPressed: () {
                        if (_currentPage != _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: const Icon(Icons.arrow_forward, size: 30),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        i == _currentPage ? _activeIndicator() : _inactiveIndicator(),
      );
    }
    return indicators;
  }

  Widget _activeIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 6.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: const Color(0xFF112031),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  Widget _inactiveIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      height: 6.0,
      width: 10.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(116, 158, 158, 158),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return Center(
      child: Container(
        width: 342,
        height: 54,
        decoration: BoxDecoration(
          color: const Color(0xFF112031),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateAccountScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Get Started',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Center(
      child: Container(
        width: 341,
        height: 53,
        decoration: BoxDecoration(
          color: const Color.fromARGB(222, 237, 232, 232),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 219, 224, 224)),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeBackScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(198, 232, 228, 228),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Already Buzzing? Sign In",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              color: Color.fromARGB(255, 7, 7, 7),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardPage extends StatefulWidget {
  final String imageUrl;
  final String? title;
  final Text? ttitle;
  final RichText? rchtitle;
  final String description;
  final Color bgColor;
  final Color descriptionTextColor;
  final Color descriptionHighlightedTextColor;
  final bool showButtons;
  final double elevation;
  final Color highlightedWordTextColor;
  final String highlightedWord;

  const OnboardPage({
    super.key,
    required this.imageUrl,
    this.title,
    this.ttitle,
    this.rchtitle,
    required this.description,
    required this.bgColor,
    required
        // required this.descriptionTextSize,
        // required this.titleTextSize,
        // required this.descriptionFontFamily,
        // required this.titleFontFamily,
        this.descriptionTextColor,
    this.descriptionHighlightedTextColor = Colors.red,
    this.showButtons = true,
    this.elevation = 0,
    this.highlightedWordTextColor = Colors.red,
    required this.highlightedWord,
  });
  @override
  State<OnboardPage> createState() => _OnboardPageState();
}



class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> words = widget.description.split(' ');
    final List<TextSpan> spans = [];

    for (int i = 0; i < words.length; i++) {
      final bool isHighlighted =
          words[i].toUpperCase() == widget.highlightedWord;

      spans.add(
        TextSpan(
          text: words[i] + (i != words.length - 1 ? ' ' : ''),
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            color: isHighlighted
                ? widget.highlightedWordTextColor
                : widget.descriptionTextColor,
          ),
        ),
      );
    }

    return Container(
      color: widget.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            widget.title?.contains('FINDING OUT EVENTS') ?? false
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: [
          Image.asset(widget.imageUrl, height: 400),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              

                
              
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: widget.title),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: spans,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//getstarted 
// class getstarted extends StatefulWidget {
//   final String imageUrl;
//   final String? title;
//   final RichText? rchtitle;
//   final EasyRichText? rtitle;
//   final String description;
//   final Color bgColor;
//   final Color descriptionTextColor;
//   final Color descriptionHighlightedTextColor;
//   final bool showButtons;
//   final double elevation;
//   final Color highlightedWordTextColor;
//   final String highlightedWord;


//   const getstarted({
//     super.key,
//     required this.imageUrl,
//     this.title,
//     this.rchtitle,
//     this.rtitle,
//     required this.description,
//     required this.bgColor,
//     required this.descriptionTextColor,   
//     this.descriptionHighlightedTextColor = Colors.red,
//     this.showButtons = true,
//     this.elevation = 0,
//     this.highlightedWordTextColor = Colors.red,
//     required this.highlightedWord,
//   });


//   @override
//   State<getstarted> createState() => _getstartedState();
// }

// class _getstartedState extends State<getstarted> {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> words = widget.description.split(' ');
//     final List<TextSpan> spans = [];

//     for (int i = 0; i < words.length; i++) {
//       final bool isHighlighted =
//           words[i].toUpperCase() == widget.highlightedWord;

//       spans.add(
//         TextSpan(
//           text: words[i] + (i != words.length - 1 ? ' ' : ''),
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 18,
//             fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
//             color: isHighlighted
//                 ? widget.highlightedWordTextColor
//                 : widget.descriptionTextColor,
//           ),
//         ),
//       );
//     }


//     return Container(
//       color: widget.bgColor,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment:
//             widget.title?.contains('FINDING OUT EVENTS') ?? false
//                 ? CrossAxisAlignment.center
//                 : CrossAxisAlignment.start,
//         children: [
//           Image.asset(widget.imageUrl, height: 400),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [


//   Widget build(BuildContext context) {
//     final List<String> words = widget.description.split(' ');
//     final List<TextSpan> spans = [];

//     for (int i = 0; i < words.length; i++) {
//       final bool isHighlighted =
//           words[i].toUpperCase() == widget.highlightedWord;

//       spans.add(
//         TextSpan(
//           text: words[i] + (i != words.length - 1 ? ' ' : ''),
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 18,
//             fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
//             color: isHighlighted
//                 ? widget.highlightedWordTextColor
//                 : widget.descriptionTextColor,
//           ),
//         ),
//       );
//     }

//     return Container(
//       color: widget.bgColor,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment:
//             widget.title?.contains('FINDING OUT EVENTS') ?? false
//                 ? CrossAxisAlignment.center
//                 : CrossAxisAlignment.start,
//         children: [
//           Image.asset(widget.imageUrl, height: 400),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
              

                
              
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(text: widget.title),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                     children: spans,
//                   ),
//                 ),
            

                
              
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(text: widget.title),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                     children: spans,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }


