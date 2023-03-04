part of '{{name.snakeCase()}}_provider.dart';

abstract class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}DataFetched extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
  final String message;
  const {{name.pascalCase()}}Error(this.message);

  @override
  List<Object> get props => [message];
}