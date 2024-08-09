import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'function_page.dart';
import 'home_screen.dart';

class MyLedPage extends StatefulWidget {
  const MyLedPage({super.key});

  @override
  _MyLedPageState createState() => _MyLedPageState();
}

class _MyLedPageState extends State<MyLedPage> {
  String? statusAck;
  String? aliveAck;
  //bool toggle = false;
  final String urlname =
      'https://v9ynxtbaw9.execute-api.ap-south-1.amazonaws.com/Dev/shadow-resource';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    //_callExtractAliveAck();
    // _callExtractStatusAck();
    _hello();
    //print(aliveAck);
    //print(aliveAck);
    if (aliveAck == "off") {
      _timer?.cancel();
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(showAlert: true)),
        );
      });
    }
    _startAutoRefresh();
  }

  void _startAutoRefresh() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      //_callExtractAliveAck();
      // _callExtractStatusAck();
      _hello();
      print(aliveAck);
      //_callExtractAliveAck();
      // _callExtractAliveAck();
      if (aliveAck == "off") {
        _timer?.cancel();
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(showAlert: true)),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _hello() async {
    final result = await extractAliveAndStatusAck(urlname);
    setState(() {
      aliveAck = result['alive'];
      statusAck = result['status'];
    });
    // aliveAck = result['alive'];
    // //print("Alive Ack: $aliveAck");

    // statusAck = result['status'];
    //print("Status Ack: $statusAck");
  }

  // void _callExtractAliveAck() async {
  //   String? aliveAck1 = await extractAliveAck(urlname);
  //   setState(() {
  //     aliveAck = aliveAck1;
  //     //print(aliveAck);
  //   });
  // }

  // void _callExtractStatusAck() async {
  //   String? statusAck1 = await extractStatusAck(urlname);
  //   setState(() {
  //     if (statusAck1 != "null") statusAck = statusAck1;
  //   });
  // }

  Future<void> _toggleLED() async {
    //_callExtractStatusAck();
    String thingName = "";
    final url = Uri.parse(urlname);
    print("Status Ack: $statusAck");
    final action = statusAck == 'on' ? 'on' : 'off';
    final payload = {
      'thingname': thingName,
      'action': action,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        setState(() {
          // if (action == 'on') {
          //   if (statusAck != 'null') {
          //     //toggle = false;
          //   }
          // }
          // if (action == 'off') {
          //   if (statusAck != 'null') {
          //     // toggle = true;
          //   }
          // }
        });
      } else {
        setState(() {});
      }
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            // Text(
            //action:
            //_callExtractAliveAck();
            //child:
            Text(aliveAck == "on" ? 'online' : 'offline'),
            // ),
            const SizedBox(height: 20),
            Text(statusAck == 'on' ? 'On' : 'Off'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleLED,
              child: Text(statusAck == "on" ? 'Turn On LED' : 'Turn Off LED'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
