import 'package:tonkeeper/features/wallet/domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.name,
    required super.symbol,
    required super.amount,
    required super.purchasePriceUsd,
    required super.currentValueUsd,
    required super.profitLossUsd,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
    name: json["name"],
    symbol: json["symbol"],
    amount: json["amount"]?.toDouble(),
    purchasePriceUsd: json["purchasePriceUSD"],
    currentValueUsd: json["currentValueUSD"]?.toDouble(),
    profitLossUsd: json["profitLossUSD"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
    "amount": amount,
    "purchasePriceUSD": purchasePriceUsd,
    "currentValueUSD": currentValueUsd,
    "profitLossUSD": profitLossUsd,
  };
}
