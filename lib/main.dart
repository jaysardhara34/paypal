import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Paypal',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Paypal Payment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map? paramiters;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 28, 61, 248),
            centerTitle: true,
            title: Text(
              widget.title,
              style: TextStyle(color: Color(0xffffffff)),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'With This Button Given below You can Make Payment Using your PayPal Account',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Tap This Button And Pay 10.28\$',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => UsePaypal(
                                sandboxMode: true,
                                clientId:
                                    "Aa_Ea_lTD3RJpO0XG8Sol6N5zyNKm0g2-Wo6UbRov66Cvx_LZ7S3o5awSCVSjrhNGnTvCCetn6HuAlWL",
                                secretKey:
                                    "EBv3khW11E8UzxuAj8-IB_tuqG8uLSlfHBdzAF8qalycW6-WCQ7HUFXDWI8C9wb5_g8AtYNgmi2aJUU4",
                                returnURL: "https://samplesite.com/return",
                                cancelURL: "https://samplesite.com/cancel",
                                transactions: const [
                                  {
                                    "amount": {
                                      "total": '10.12',
                                      "currency": "USD",
                                      "details": {
                                        "subtotal": '10.12',
                                        "shipping": '0',
                                        "shipping_discount": 0
                                      }
                                    },
                                    "description":
                                        "The payment transaction description.",
                                    // "payment_options": {
                                    //   "allowed_payment_method":
                                    //       "INSTANT_FUNDING_SOURCE"
                                    // },
                                    "item_list": {
                                      "items": [
                                        {
                                          "name": "A demo product",
                                          "quantity": 1,
                                          "price": '10.12',
                                          "currency": "USD"
                                        }
                                      ],

                                      // shipping address is not required though
                                      "shipping_address": {
                                        "recipient_name": "Jane Foster",
                                        "line1": "Travis County",
                                        "line2": "",
                                        "city": "Austin",
                                        "country_code": "US",
                                        "postal_code": "73301",
                                        "phone": "+00000000",
                                        "state": "Texas"
                                      },
                                    }
                                  }
                                ],
                                note:
                                    "Contact us for any questions on your order.",
                                onSuccess: (Map params) async {
                                  Fluttertoast.showToast(
                                      msg: "Pament Done ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Text("onSuccess: $params");
                                  setState(() {
                                    paramiters = params;
                                    print(paramiters);
                                  });
                                },
                                onError: (error) {
                                  Fluttertoast.showToast(
                                      msg: "Connection Error",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  print("onError: $error");
                                },
                                onCancel: (params) {
                                  Fluttertoast.showToast(
                                      msg: "Payment Cancelled",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  print('cancelled: $params');
                                }),
                          ),
                        )
                      },
                      child: const Text(
                        "Make Payment",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.30,
                                MediaQuery.of(context).size.height * 0.05),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 3, 110, 249)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ))),
                    ),
                    SizedBox(height: 20,),
                    paramiters != null?Text("Payer Id: ${paramiters?['payerID']}"):Text(''),
                    SizedBox(height: 20,),
                    paramiters != null?Text("Payment Id: ${paramiters?['paymentId']}"):Text(''),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
