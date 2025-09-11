import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tonkeeper/core/resources/data_state.dart';
import 'package:tonkeeper/features/wallet/domain/use_cases/get_wallet_data_usecase.dart';
import 'package:tonkeeper/features/wallet/presentation/bloc/wallet_status.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final GetWalletDataUseCase getWalletDataUseCase;

  WalletBloc(this.getWalletDataUseCase) : super(WalletState(walletStatus: WalletLoading())) {
    on<FetchWalletData>(onFetchWalletData);
  }

  Future<void> onFetchWalletData(FetchWalletData event, Emitter<WalletState> emit) async {
    emit(state.copyWith(WalletLoading()));

    DataState dataState = await getWalletDataUseCase(null);

    if (dataState is DataSuccess) {
      emit(state.copyWith(WalletLoaded(dataState.data)));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(WalletError(dataState.error ?? "error")));
    }
  }
}
