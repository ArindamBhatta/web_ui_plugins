import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      builder: (BuildContext ctx, GoRouterState state) => ClientSectionPage(
        initialSelectedItemId: state.uri.queryParameters['selected'],
      ),
    ),
  ],
);

class ClientSectionPage extends StatelessWidget {
  final String? initialSelectedItemId;

  const ClientSectionPage({super.key, this.initialSelectedItemId});

  ScopedRepo<ClientModel> _resolveRepo(BuildContext context) {
    try {
      return RepositoryProvider.of<ScopedRepo<ClientModel>>(context);
    } catch (_) {
      final binding = clientPlugin.dataBinding;
      return ScopedRepo<ClientModel>(
        moduleId: clientPlugin.moduleId,
        service: FirestoreService<ClientModel>(
          moduleId: clientPlugin.moduleId,
          collectionName: binding.collectionName,
          fromJson: binding.fromJson,
        ),
      );
    }
  }

  Widget _buildSection(BuildContext context, ScopedRepo<ClientModel> repo) {
    final cubit = BlocProvider.of<FormCubit<ClientModel>>(context);

    return SectionWidget<ClientModel>(
      sectionLabel: ShalloonSection.clients.label,
      sectionIcon: ShalloonSection.clients.icon,
      sectionColor: ShalloonSection.clients.color,
      sectionTitle: 'Clients',
      repo: repo,
      formCubit: cubit,
      initialSelectedItemId: initialSelectedItemId,
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

  @override
  Widget build(BuildContext context) {
    final repo = _resolveRepo(context);
    FormCubit<ClientModel>? existingCubit;
    try {
      existingCubit = BlocProvider.of<FormCubit<ClientModel>>(context);
    } catch (_) {
      existingCubit = null;
    }

    if (existingCubit != null) {
      return _buildSection(context, repo);
    }

    return BlocProvider<FormCubit<ClientModel>>(
      create: (_) => FormCubit<ClientModel>(repo: repo),
      child: Builder(builder: (ctx) => _buildSection(ctx, repo)),
    );
  }
}
