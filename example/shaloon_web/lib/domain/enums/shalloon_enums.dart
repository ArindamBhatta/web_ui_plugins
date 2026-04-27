import 'package:flutter/material.dart';

// ── Section enum ──────────────────────────────────────────────────────────────
// The developer just adds values here; the plugin registry generates the sidebar.
enum ShalloonSection {
  // People
  staff,
  clients,

  // Operations
  appointments,
  services,
  billing,

  // Settings
  operators,
}

extension ShalloonSectionX on ShalloonSection {
  String get label {
    switch (this) {
      case ShalloonSection.staff:
        return 'Staff';
      case ShalloonSection.clients:
        return 'Clients';
      case ShalloonSection.appointments:
        return 'Appointments';
      case ShalloonSection.services:
        return 'Services';
      case ShalloonSection.billing:
        return 'Billing';
      case ShalloonSection.operators:
        return 'Operators';
    }
  }

  IconData get icon {
    switch (this) {
      case ShalloonSection.staff:
        return Icons.badge_outlined;
      case ShalloonSection.clients:
        return Icons.people_alt_outlined;
      case ShalloonSection.appointments:
        return Icons.calendar_today_outlined;
      case ShalloonSection.services:
        return Icons.content_cut_outlined;
      case ShalloonSection.billing:
        return Icons.receipt_long_outlined;
      case ShalloonSection.operators:
        return Icons.admin_panel_settings_outlined;
    }
  }

  Color get color {
    switch (this) {
      case ShalloonSection.staff:
        return Colors.blue;
      case ShalloonSection.clients:
        return Colors.green;
      case ShalloonSection.appointments:
        return Colors.purple;
      case ShalloonSection.services:
        return Colors.orange;
      case ShalloonSection.billing:
        return Colors.teal;
      case ShalloonSection.operators:
        return Colors.blueGrey;
    }
  }

  int get order {
    switch (this) {
      case ShalloonSection.staff:
        return 0;
      case ShalloonSection.clients:
        return 1;
      case ShalloonSection.appointments:
        return 2;
      case ShalloonSection.services:
        return 3;
      case ShalloonSection.billing:
        return 4;
      case ShalloonSection.operators:
        return 5;
    }
  }
}

// ── Persona / Role enum ───────────────────────────────────────────────────────
enum ShalloonPersona { admin, manager, stylist, receptionist }

extension ShalloonPersonaX on ShalloonPersona {
  String get label {
    switch (this) {
      case ShalloonPersona.admin:
        return 'Admin';
      case ShalloonPersona.manager:
        return 'Manager';
      case ShalloonPersona.stylist:
        return 'Stylist';
      case ShalloonPersona.receptionist:
        return 'Receptionist';
    }
  }
}

// ── Appointment status enum ───────────────────────────────────────────────────
enum AppointmentStatus { scheduled, inProgress, completed, cancelled, noShow }

extension AppointmentStatusX on AppointmentStatus {
  String get label {
    switch (this) {
      case AppointmentStatus.scheduled:
        return 'Scheduled';
      case AppointmentStatus.inProgress:
        return 'In Progress';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.noShow:
        return 'No Show';
    }
  }

  Color get color {
    switch (this) {
      case AppointmentStatus.scheduled:
        return Colors.blue;
      case AppointmentStatus.inProgress:
        return Colors.orange;
      case AppointmentStatus.completed:
        return Colors.green;
      case AppointmentStatus.cancelled:
        return Colors.red;
      case AppointmentStatus.noShow:
        return Colors.grey;
    }
  }
}
