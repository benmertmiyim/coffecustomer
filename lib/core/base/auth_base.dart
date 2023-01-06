abstract class AuthBase {
  Future<Object?> getCurrentCustomer();

  Future<Object?> signInWithEmailAndPassword(String email, String password);

  Future<Object?> sendPasswordResetEmail(String email);

  Future<Object?> createUserWithEmailAndPassword(
    String email,
    String password,
    String nameSurname,
  );

  Future signOut();
}
