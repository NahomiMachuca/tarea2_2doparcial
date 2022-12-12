import 'package:flutter/material.dart';
import 'services/mockapi.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asincronia flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[100],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink[200],
          secondary: Colors.pink[100],
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child:
                  Text('Asincronia con Flutter', textAlign: TextAlign.center)),
        ),
        body: const EstadosAsync(),
      ),
    );
  }
}

class EstadosAsync extends StatefulWidget {
  const EstadosAsync({super.key});

  @override
  State<StatefulWidget> createState() => _EstadosAsync();
}

class _EstadosAsync extends State<EstadosAsync> {
  /*Variables a utilizar*/
  int ferrari = 0,
      hyundai = 0,
      fisherPrice = 0,
      timeFerr = 0,
      timeHyu = 0,
      timeFish = 0;
  bool selected = true;
  late double widthFerr = 0,
      widthHyu = 0,
      widthFish = 0,
      heightFerr = 10,
      heightHyu = 10,
      heightFish = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*Ferrari*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.large(
                  onPressed: () async {
                    setState(() {
                      widthFerr = 300.0;
                      heightFerr = 10.0;
                      timeFerr = 1;
                    });
                    ferrari = await MockApi().getFerrariInteger();
                    setState(() {
                      widthFerr = 0.0;
                      heightFerr = 10.0;
                      timeFerr = 0;
                    });
                  },
                  backgroundColor: Colors.cyan,
                  child: const Icon(
                    Icons.flare_outlined,
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              width: widthFerr,
              height: heightFerr,
              color: Colors.cyan,
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: timeFerr),
            ),
            Text(
              ferrari.toString(),
              style: const TextStyle(
                  color: Colors.cyan,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
            /*Hyundai*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.large(
                  onPressed: () async {
                    setState(() {
                      widthHyu = 300.0;
                      heightHyu = 10.0;
                      timeHyu = 3;
                    });
                    hyundai = await MockApi().getHyundaiInteger();
                    setState(() {
                      widthHyu = 0.0;
                      heightHyu = 10.0;
                      timeHyu = 0;
                    });
                  },
                  backgroundColor: Colors.pink[300],
                  child: const Icon(Icons.heart_broken),
                )
              ],
            ),
            AnimatedContainer(
              width: widthHyu,
              height: heightHyu,
              color: Colors.pink[300],
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: timeHyu),
            ),
            Text(
              hyundai.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 240, 98, 146),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
            /*FishPrice*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.large(
                  onPressed: () async {
                    setState(() {
                      widthFish = 300.0;
                      heightFish = 10.0;
                      timeFish = 9;
                    });
                    fisherPrice = await MockApi().getFisherPriceInteger();
                    setState(() {
                      widthFish = 0.0;
                      heightFish = 10.0;
                      timeFish = 0;
                    });
                  },
                  backgroundColor: Colors.purple[300],
                  child: const Icon(Icons.star),
                )
              ],
            ),
            AnimatedContainer(
              width: widthFish,
              height: heightFish,
              color: Colors.purple[300],
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: timeFish),
            ),
            Text(
              fisherPrice.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 185, 104, 200),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
          ]),
    );
  }
}
