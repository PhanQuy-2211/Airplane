import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> signUpWithEmailAndPassword(String email, String password) async {

  try {
    UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password); 
    return credential.user;
  } catch(e) {
    print("Some error occured");
  }
  return null;

}

Future<User?> signInWithEmailAndPassword(String email, String password) async {

  try {
    UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  } catch(e) {
    print("Some error occured");
  }
  return null;

}

Future<void> resetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    print("Password reset email sent");
  } catch (e) {
    print("Error: $e");
  }
}

Future<void> registerUser(String email, String password, String displayName) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    // Cập nhật tên hiển thị
    await userCredential.user?.updateDisplayName(displayName);
    await userCredential.user?.reload();
  } catch (e) {
    print("Lỗi đăng ký: $e");
  }
}
}