import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable {
  final String name;
  final String symbol;
  final double amount;
  final int purchasePriceUsd;
  final double currentValueUsd;
  final double profitLossUsd;

  const AssetEntity({
    required this.name,
    required this.symbol,
    required this.amount,
    required this.purchasePriceUsd,
    required this.currentValueUsd,
    required this.profitLossUsd,
  });

  @override
  List<Object?> get props => [name, symbol, amount, purchasePriceUsd, currentValueUsd, profitLossUsd];
}
