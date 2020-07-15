import 'package:cloud_firestore/cloud_firestore.dart';

// add is sucess or not
Future<void> uploadingData(String _name, int _amount, String _email,
    String _phone, String _paymode) async {
  await Firestore.instance.collection("products").add({
    'Name': _name,
    'Amount': _amount,
    'email': _email,
    'phone': _phone,
    'payment mode': _paymode,
  });
}
