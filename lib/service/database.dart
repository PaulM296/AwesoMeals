import 'package:awesomeals/service/sample_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await _firestore.collection("users").doc(id).set(userInfoMap);
  }

  Future increaseUserWalletAmount(int newAmount, String? id) async {
    try {
      final docRef = _firestore.collection("users").doc(id);

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

  Future getUser(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection("users")
          .where("Email", isEqualTo: email)
          .get();

      Map<String, dynamic>? user = querySnapshot.docs.first.data();
      return user;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> addRestaurant(Map<String, dynamic> restaurantData) async {
    await _firestore.collection('restaurants').add(restaurantData);
  }

  Future<void> addDish(Map<String, dynamic> dishData) async {
    await _firestore.collection('dishes').add(dishData);
  }

  Future<void> addOrder(Map<String, dynamic> orderData) async {
    await _firestore.collection('orders').add(orderData);
  }

  Future<List<Map<String, dynamic>>> getRestaurants() async {
    QuerySnapshot snapshot = await _firestore.collection('restaurants').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<List<Map<String, dynamic>>> getDishesByRestaurant(String restaurantId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('dishes')
        .where('restaurantId', isEqualTo: restaurantId)
        .get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<List<Map<String, dynamic>>> getOrders(String userId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<List<Map<String, dynamic>>> getDishes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('dishes')
          .limit(4)
          .get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> addSampleData() async {
    for (var restaurant in sampleRestaurants) {
      await addRestaurant(restaurant);
    }
    for (var dish in sampleDishes) {
      await addDish(dish);
    }
  }
}
