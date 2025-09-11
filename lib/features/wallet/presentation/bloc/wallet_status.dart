import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tonkeeper/features/wallet/domain/entities/wallet_entity.dart';

@immutable
sealed class WalletStatus extends Equatable {
  const WalletStatus();

  @override
  List<Object?> get props => [];
}

class WalletLoading extends WalletStatus {}

class WalletError extends WalletStatus {
  final String message;

  const WalletError(this.message);

  @override
  List<Object?> get props => [message];
}

class WalletLoaded extends WalletStatus {
  WalletEntity walletEntity;

  WalletLoaded(this.walletEntity);

  @override
  List<Object?> get props => [walletEntity];
}
