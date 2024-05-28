import 'package:awesomeals/service/database.dart';
import 'package:awesomeals/service/shared_pref.dart';
import 'package:awesomeals/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet;

  getSharedPreference() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});
  }

  onLoad() async {
    await getSharedPreference();
    setState(() {});
  }

  @override
  void initState() {
    onLoad();
    super.initState();
  }

  void _showAddMoneyDialog({String initialAmount = ""}) {
    TextEditingController amountController = TextEditingController(text: initialAmount);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Money"),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter amount"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                String newAmount = amountController.text;
                if (newAmount.isNotEmpty) {
                  // Get the current wallet amount
                  String? currentAmountString = await SharedPreferenceHelper().getUserWallet();
                  int currentAmount = int.tryParse(currentAmountString ?? "0") ?? 0;

                  // Add the new amount to the current amount
                  int  newAmountDouble =  int .tryParse(newAmount) ?? 0;
                  int  updatedAmount = currentAmount + newAmountDouble;

                  // Save the updated amount back to shared preferences
                  await SharedPreferenceHelper().saveUserWallet(updatedAmount.toString());
                  String? userId = await SharedPreferenceHelper().getUserId();
                  await DatabaseMethods().increaseUserWalletAmount(newAmountDouble, userId);

                  await getSharedPreference(); // Refresh the wallet value
                  Navigator.of(context).pop(); // Dismiss the dialog
                }
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: AppWidget.HeadlineTextFieldStyle(),
                  ),
                ),
              ),
              color: Color(0xFFFF9900),
            ),
            SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/Wallet-icon.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your wallet",
                        style: AppWidget.biggerSemiboldTextFieldStyle(),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "\$$wallet",
                        style: AppWidget.biggerSemiboldTextFieldStyle(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add money",
                style: AppWidget.biggerSemiboldTextFieldStyle(),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _presetAmountButton("\$100", "100"),
                _presetAmountButton("\$500", "500"),
                _presetAmountButton("\$1000", "1000"),
                _presetAmountButton("\$2000", "2000"),
              ],
            ),
            SizedBox(height: 50.0),
            GestureDetector(
              onTap: () => _showAddMoneyDialog(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF2C325D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Add Money",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _presetAmountButton(String label, String amount) {
    return GestureDetector(
      onTap: () => _showAddMoneyDialog(initialAmount: amount),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE9E2E2)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: AppWidget.biggerSemiboldTextFieldStyle(),
        ),
      ),
    );
  }
}
