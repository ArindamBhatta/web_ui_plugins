import 'package:flutter/widgets.dart';
import 'package:form_template/core/form/cubit/form_cubit.dart';
import 'package:form_template/core/repo/form_repo_mixin.dart';
import 'package:form_template/core/widgets/enums.dart';

import '../../../models/interface/data_model.dart';

class SectionWidget<T extends DataModel> extends StatefulWidget {
  final Section section;
  final String sectionTitle;
  final FormRepoMixin<T> repo;
  final FormCubit formCubit;
  final Widget Function(T item, BuildContext context) initialTabDetailBuilder;

  const SectionWidget({
    super.key,
    required this.section,
    required this.sectionTitle,
    required this.repo,
    required this.formCubit,
    required this.initialTabDetailBuilder,
  });

  @override
  State<SectionWidget<T>> createState() => _SectionWidgetState<T>();
}

class _SectionWidgetState<T extends DataModel> extends State<SectionWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
