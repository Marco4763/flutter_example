import 'package:flutter_example/cubit/search/search_cubit.dart';
import 'package:flutter_example/dao/cep_dao.dart';
import 'package:flutter_example/dao/i_cep_dao.dart';
import 'package:flutter_example/network/provider/i_network_provider.dart';
import 'package:flutter_example/network/provider/network_provider.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

Future<void> inject() async {
  dependency.registerSingleton<INetworkProvider>(NetworkProvider());

  dependency.registerSingleton<ICepDao>(
      CepDao(provider: dependency<INetworkProvider>()));

  dependency.registerSingleton<SearchCubit>(
      SearchCubit(cepDao: dependency<ICepDao>()));
}
