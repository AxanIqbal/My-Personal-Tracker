import 'package:cloud_firestore/cloud_firestore.dart';

import '../../application/models/user/user.dart';

final usersProject =
    FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, options) => User.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
