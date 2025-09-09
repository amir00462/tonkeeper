import 'package:tonkeeper/core/resources/data_state.dart';
import 'package:tonkeeper/features/wallet/domain/entities/wallet_entity.dart';

abstract class WalletRepository {
  Future<DataState<WalletEntity>> getWalletData();
}
