
List<BlocProvider> get {{BrickChangeName.PascalCase()}}BlocProviders() {
  return [
    BlocProvider< {{BrickChangeName.PascalCase()}}Bloc>(
      create: (_) => GetIt.instance< {{BrickChangeName.PascalCase()}}Bloc>(),
    ),
  ];
}
