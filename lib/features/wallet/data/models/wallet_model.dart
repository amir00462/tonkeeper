import 'package:tonkeeper/features/wallet/data/models/asset_model.dart';
import 'package:tonkeeper/features/wallet/domain/entities/wallet_entity.dart';

class WalletModel extends WalletEntity {
  const WalletModel({
    required super.totalBalanceUsd,
    required super.walletAddress,
    required super.walletType,
    required super.assets,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    totalBalanceUsd: json["totalBalanceUSD"]?.toDouble(),
    walletAddress: json["walletAddress"],
    walletType: json["walletType"],
    assets: List<AssetModel>.from(json["assets"].map((x) => AssetModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalBalanceUSD": totalBalanceUsd,
    "walletAddress": walletAddress,
    "walletType": walletType,
    "assets": List<dynamic>.from(assets.map((asset) => (asset as AssetModel).toJson())),
  };
}
