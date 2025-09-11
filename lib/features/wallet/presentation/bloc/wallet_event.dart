part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class FetchWalletData extends WalletEvent {}
