import 'package:dio/dio.dart';
import 'package:tonkeeper/core/resources/data_state.dart';
import 'package:tonkeeper/features/wallet/data/data_source/remote/api_provider.dart';
import 'package:tonkeeper/features/wallet/data/models/wallet_model.dart';
import 'package:tonkeeper/features/wallet/domain/entities/wallet_entity.dart';
import 'package:tonkeeper/features/wallet/domain/repository/wallet_repository.dart';

class WalletRepositoryImpl extends WalletRepository {
  ApiProvider apiProvider;
  WalletRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<WalletEntity>> getWalletData() async {
    try {
      Response response = await apiProvider.getWalletData();

      if (response.statusCode == 200) {
        WalletEntity walletEntity = WalletModel.fromJson(response.data);
        return DataSuccess(walletEntity);
      } else {
        return DataFailed("Failed to get wallet data");
      }
    } catch (e) {
      return DataFailed("Failed to get wallet data");
    }
  }
}
