import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  late final SupabaseClient supabaseClient;

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal() {
    supabaseClient = SupabaseClient('https://pvjavbraloebkyynhjmm.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB2amF2YnJhbG9lYmt5eW5oam1tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY3ODY0NjgsImV4cCI6MjA0MjM2MjQ2OH0._hMhRIanEYXGf_p1Gx3CXuK0Xuk-ixiZvYSIrXC0eMo');
  }
}
