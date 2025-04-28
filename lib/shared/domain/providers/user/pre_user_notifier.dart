import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosi2/shared/domain/models/user/pre_user.dart';

class PreUserWalletNotifier extends StateNotifier<PreUserWallet> {
  PreUserWalletNotifier() : super(const PreUserWallet());

  Future<void> setUser(PreUserWallet user) async {
    state = user;
  }

  Future<void> clearUser() async {
    state = const PreUserWallet();
  }
}
