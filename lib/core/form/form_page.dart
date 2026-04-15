import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:form_template/core/form/cubit/form_cubit.dart';
import 'package:form_template/models/interface/data_model.dart';

enum FieldType {
  status,
  general,
  name,
  address,
  mobileNumber,
  whatsapp,
  email,
  password,
  age,
  dropdown,
  date,
  time,
  multiSelect,
  amount,
}

enum SortBy { name, id }

enum SortOrder { ascending, descending }

class FormPageview extends StatefulWidget {
  final FormCubit formCubit;
  final DataModel dataModel;
  final List<WidgetConfig> fields;
  const FormPageview({
    super.key,
    required this.formCubit,
    required this.dataModel,
    required this.fields,
  });

  @override
  State<FormPageview> createState() => _FormPageviewState();
}

class _FormPageviewState extends State<FormPageview> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

abstract class WidgetConfig {
  final FieldType fieldType;
  final String key;
  final String? initialValue;
  final String? labelText;
  final IconData? icon;
  final double? iconSize;
  final bool? enabled;
  final bool? mandatory;
  final bool keepTextVisible; //globally access
  final bool Function(String)? isDuplicate;
  final TextCapitalization? textCapitalization;
  final bool Function(Map<String, dynamic> formData)? isVisible;

  const WidgetConfig({
    required this.fieldType,
    required this.key,
    this.initialValue,
    this.labelText,
    this.icon,
    this.iconSize,
    this.enabled,
    this.mandatory,
    this.keepTextVisible = false,
    this.isDuplicate,
    this.textCapitalization,
    this.isVisible,
  });
}

class ListingWidgetConfig extends WidgetConfig {
  final List<DataModel> items;
  final DataModel? initialData;
  final String? Function(DataModel?)? itemLabel;
  final SortBy? sortBy;
  final SortOrder? sortOrder;
  final List<DataModel> Function(Map<String, dynamic> formData)? itemsBuilder;
  final void Function(DataModel?, Map<String, dynamic>)? onChanged;
  final String? dialogFooterMessage;
  final String? emptyStateMessage;
  final IconData? emptyStateIcon;
  final bool enableTextFieldTap;

  ListingWidgetConfig({
    required super.key,
    super.initialValue,
    super.labelText,
    super.icon,
    super.iconSize,
    super.enabled,
    super.mandatory,
    super.keepTextVisible,
    required this.items,
    this.initialData,
    this.itemLabel,
    this.sortBy,
    this.sortOrder,
    this.itemsBuilder,
    this.onChanged,
    this.dialogFooterMessage,
    this.emptyStateMessage,
    this.emptyStateIcon,
    this.enableTextFieldTap = true,
    super.isVisible,
  }) : super(fieldType: FieldType.dropdown);
}
