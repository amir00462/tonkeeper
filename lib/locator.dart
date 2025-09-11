import 'package:get_it/get_it.dart';
import 'package:tonkeeper/features/wallet/data/data_source/remote/api_provider.dart';
import 'package:tonkeeper/features/wallet/data/repository/wallet_repository_impl.dart';
import 'package:tonkeeper/features/wallet/domain/repository/wallet_repository.dart';
import 'package:tonkeeper/features/wallet/domain/use_cases/get_wallet_data_usecase.dart';
import 'package:tonkeeper/features/wallet/presentation/bloc/wallet_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  // database - rest api
  locator.registerSingleton<ApiProvider>(ApiProvider());

  // repository
  locator.registerSingleton<WalletRepository>(WalletRepositoryImpl(locator()));

  // use-case
  locator.registerSingleton<GetWalletDataUseCase>(GetWalletDataUseCase(locator()));

  // bloc
  locator.registerSingleton<WalletBloc>(WalletBloc(locator()));
}
