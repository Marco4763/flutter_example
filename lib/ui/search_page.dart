import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/cubit/search/search_cubit.dart';
import 'package:flutter_example/di/dependency_injection.dart';
import 'package:flutter_example/widgets/item_widget.dart';
import 'package:flutter_example/widgets/text_form_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final cubit = dependency.get<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormWidget(
              formKey: cubit.key,
              controller: cubit.cepController,
              hint: 'Insira o CEP',
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (cubit.key.currentState!.validate()) {
                  cubit.searchCep();
                }
              },
              child: const Text(
                'Procurar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white24,
              child: SizedBox(
                width: 250,
                height: 250,
                child: BlocProvider<SearchCubit>(
                  create: (context) => cubit,
                  child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                    if (state is SearchInProgressState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    if (state is SearchSucceedState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemWidget(
                            title: 'cep',
                            element: state.model.cep!,
                          ),
                          ItemWidget(
                            title: 'logradouro',
                            element: state.model.logradouro!,
                          ),
                          ItemWidget(
                            title: 'complemento',
                            element: state.model.complemento!,
                          ),
                          ItemWidget(
                            title: 'bairro',
                            element: state.model.bairro!,
                          ),
                        ],
                      );
                    }
                    if (state is SearchFailureState) {
                      return Center(
                        child: Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
