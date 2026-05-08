import 'package:vet_application/domain/enums/vet_application_enums.dart';
import 'package:vet_application/domain/models/technician_model.dart';
import 'package:web_ui_plugins/web_ui_plugins.dart';

final PluginDescriptor<TechnicianModel>
technicianPlugin = PluginDescriptor<TechnicianModel>(
  moduleId: 'technicians',
  title: VetAppSection.technicians.label,
  icon: VetAppSection.technicians.icon,
  color: VetAppSection.technicians.color,
  order: VetAppSection.technicians.order,

  // The features the plugin supports. The framework uses this to enable/disable UI and functionality.
  features: const PluginFeatureFlags(
    supportsCrud: true,
    supportsRealtime: true,
    supportsUpload: false,
  ),

  visibilityPolicy: PersonaPermissionPolicy({'admin', 'manager', 'technician'}),
  dataBinding: PluginDataBinding(
    collectionName: 'technicians',
    fromJson: (json) => TechnicianModel.fromJson(json),
    createEmpty: () => TechnicianModel(),
  ),
);
