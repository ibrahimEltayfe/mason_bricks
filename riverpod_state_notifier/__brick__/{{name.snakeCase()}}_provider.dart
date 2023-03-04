import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';
part '{{name.snakeCase()}}_state.dart';

final {{name.camelCase()}}Provider = StateNotifierProvider<{{name.pascalCase()}}Provider,{{name.pascalCase()}}State>(
  (ref) => {{name.pascalCase()}}Provider()
);

class {{name.pascalCase()}}Provider extends StateNotifier<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Provider() : super({{name.pascalCase()}}Initial());
}
