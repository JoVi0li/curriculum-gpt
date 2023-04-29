import 'package:curriculumgpt/modules/auth/domain/errors/google_sign_in_errors.dart';
import 'package:curriculumgpt/modules/auth/presenter/blocs/sign_in_bloc.dart';
import 'package:curriculumgpt/modules/auth/presenter/events/sign_in_events.dart';
import 'package:curriculumgpt/modules/auth/presenter/states/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final getIt = GetIt.I;
  late final SignInBloc bloc;
  late final MaterialStatesController buttonStatesController;

  @override
  void initState() {
    super.initState();
    bloc = getIt<SignInBloc>();
    buttonStatesController = MaterialStatesController();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<SignInBloc>();
    buttonStatesController.dispose();
    super.dispose();
  }

  void googleSignIn() {
    bloc.add(GoogleSignInEvent());
  }

  SnackBar snackBar(String text, BuildContext ctx) {
    return SnackBar(
      content: Text(
        text,
        style: Theme.of(ctx).textTheme.bodyMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        bloc: bloc,
        listener: (ctx, state) {
          if (state is ErrorSignInState<GoogleSignInError>) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              snackBar('${state.error.error}\n${state.error.message}', ctx),
            );
            if (state is LoadingSignInState) {
              buttonStatesController.update(MaterialState.disabled, true);
            } else {
              final buttonAreDisabled = buttonStatesController.value.any(
                (element) => element == MaterialState.disabled,
              );
              if (!buttonAreDisabled) return;
              buttonStatesController.update(MaterialState.disabled, false);
            }
          }
        },
        builder: (context, state) => SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'CurriculumGPT',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Crie currículos incríveis em instantes.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  statesController: buttonStatesController,
                  onPressed: googleSignIn,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Login com Google',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Image.asset('lib/shared/assets/icons/google_icon.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
