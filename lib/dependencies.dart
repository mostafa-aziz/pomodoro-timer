import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class BaseDependencies extends StatelessWidget {
  final Widget _child;

  const BaseDependencies({
    Key? key,
    required Widget child,
  })  : _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._buildBaseProviders(),
          ..._buildAuthProviders(),
          ..._buildBaseRepositoriesProviders(),
          ..._buildBaseUseCasesProviders(),
          ..._buildBaseStoresProviders(),
        ],
        child: _child,
      );

  List<SingleChildWidget> _buildBaseProviders() => [];

  List<SingleChildWidget> _buildAuthProviders() => [];

  List<SingleChildWidget> _buildBaseRepositoriesProviders() => [];

  List<SingleChildWidget> _buildBaseUseCasesProviders() => [];

  List<SingleChildWidget> _buildBaseStoresProviders() => [];
}
