import 'package:order_food_app/config/repository/login/iauthen_repository.dart';
import 'package:order_food_app/config/service/server_service.dart';

class AuthenRepository extends IAuthenRepository {
  final ServerService serverService;

  AuthenRepository({required this.serverService});

  @override
  Future<bool> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      await serverService.supabaseClient.auth
          .signInWithPassword(password: password, email: email);
      return true;
    } catch (e) {
      handleError(e);
      rethrow;
    }
  }

  @override
  Future<void> signLogOut() async {
    return serverService.supabaseClient.auth.signOut();
  }
}
