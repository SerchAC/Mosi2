import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosi2/shared/domain/models/user/pre_user.dart';
import 'package:mosi2/shared/domain/providers/user/pre_user_notifier.dart';

final preUserWalletNotifierProvider =
    StateNotifierProvider<PreUserWalletNotifier, PreUserWallet>(
  (ref) => PreUserWalletNotifier(),
);
