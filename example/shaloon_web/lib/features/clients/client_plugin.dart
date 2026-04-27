import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_ui_plugins/web_ui_plugins.dart';

import '../../domain/enums/shalloon_enums.dart';
import '../../domain/models/client_model.dart';
import 'client_view.dart';

/// Client plugin descriptor.
final clientPlugin = PluginDescriptor<ClientModel>(
  moduleId: 'clients',
  title: ShalloonSection.clients.label,
  icon: ShalloonSection.clients.icon,
  color: ShalloonSection.clients.color,
  order: ShalloonSection.clients.order,
  features: const PluginFeatureFlags(
    supportsCrud: true,
    supportsRealtime: true,
    supportsUpload: true, // profile photo
  ),
  // All personas can view clients
  visibilityPolicy: PersonaPermissionPolicy({
    ShalloonPersona.admin.label,
    ShalloonPersona.manager.label,
    ShalloonPersona.receptionist.label,
    ShalloonPersona.stylist.label,
  }),
  dataBinding: PluginDataBinding<ClientModel>(
    collectionName: 'clients',
    fromJson: ClientModel.fromJson,
    createEmpty: ClientModel.empty,
  ),
  routes: [
    PluginRouteDescriptor(
      path: '/clients',
      builder: (ctx) => const ClientSectionPage(),
    ),
  ],
);

class ClientSectionPage extends StatelessWidget {
  const ClientSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = RepositoryProvider.of<ScopedRepo<ClientModel>>(context);
    final cubit = BlocProvider.of<FormCubit<ClientModel>>(context);

    return SectionWidget<ClientModel>(
      section: Section.values.byName('clients'),
      sectionTitle: 'Clients',
      repo: repo,
      formCubit: cubit,
      createEmptyModel: ClientModel.empty,
      rebuildDataModel: (data) => ClientModel(
        id: data['id'] as String?,
        name: data['name'] as String?,
        mobile: data['mobile'] as String?,
        email: data['email'] as String?,
        whatsapp: data['whatsapp'] as String?,
        address: data['address'] as String?,
      ),
      initialTabDetailBuilder: (item, ctx) => ClientDetailView(client: item),
    );
  }
}
