import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future increaseUserWalletAmount(int newAmount, String? id) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      final docRef = db.collection("users").doc(id);

      DocumentSnapshot<Map<String, dynamic>> userDocSnapshot =
          await docRef.get();
      Map<String, dynamic>? user = userDocSnapshot.data();

      int currentWalletAmount = int.parse(user?['Wallet'] ?? '0');

      // Add the new amount to the current amount
      int updatedWalletAmount = currentWalletAmount + newAmount;

      await docRef.update({'Wallet': updatedWalletAmount.toString()});
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
