import 'package:flutter/material.dart';

// ── Section enum ──────────────────────────────────────────────────────────────
// The developer just adds values here; the plugin registry generates the sidebar.
enum VetAppSection {
  staff,
  petOwners,
  doctors,

  // Operations
  appointments,
  services,
  billing,

  // Settings
  operators,
}

extension VetAppSectionX on VetAppSection {
  String get label {
    switch (this) {
      case VetAppSection.staff:
        return 'Staff';
      case VetAppSection.petOwners:
        return 'Pet Owners';
      case VetAppSection.doctors:
        return 'Doctors';
      case VetAppSection.appointments:
        return 'Appointments';
      case VetAppSection.services:
        return 'Services';
      case VetAppSection.billing:
        return 'Billing';
      case VetAppSection.operators:
        return 'Operators';
    }
  }

  IconData get icon {
    switch (this) {
      case VetAppSection.staff:
        return Icons.badge_outlined;
      case VetAppSection.petOwners:
        return Icons.people_alt_outlined;
      case VetAppSection.doctors:
        return Icons.local_hospital_outlined;
      case VetAppSection.appointments:
        return Icons.calendar_today_outlined;
      case VetAppSection.services:
        return Icons.content_cut_outlined;
      case VetAppSection.billing:
        return Icons.receipt_long_outlined;
      case VetAppSection.operators:
        return Icons.admin_panel_settings_outlined;
    }
  }

  Color get color {
    switch (this) {
      case VetAppSection.staff:
        return Colors.blue;
      case VetAppSection.petOwners:
        return Colors.green;
      case VetAppSection.appointments:
        return Colors.purple;
      case VetAppSection.services:
        return Colors.orange;
      case VetAppSection.billing:
        return Colors.teal;
      case VetAppSection.operators:
        return Colors.blueGrey;
      case VetAppSection.doctors:
        return Colors.red;
    }
  }

  int get order {
    switch (this) {
      case VetAppSection.staff:
        return 0;
      case VetAppSection.petOwners:
        return 1;
      case VetAppSection.appointments:
        return 2;
      case VetAppSection.services:
        return 3;
      case VetAppSection.billing:
        return 4;
      case VetAppSection.operators:
        return 5;
      case VetAppSection.doctors:
        return 6;
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
