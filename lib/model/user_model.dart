import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String phoneNumber;
  final String uid;
  final String fullName;
  const UserModel(
      {required this.email,required this.phoneNumber,required  this.uid,required  this.fullName,  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      fullName: snapshot["fullName"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      phoneNumber: snapshot["phoneNumber"],
      
    );
  }

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "uid": uid,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}