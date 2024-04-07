import 'package:supabase_flutter/supabase_flutter.dart';

  class initBaseDonne{
    static SupabaseClient initialize() {
      return SupabaseClient(
        'https://abhsxqmlsjhtjsdmvwrv.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiaHN4cW1sc2podGpzZG12d3J2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIwNzQ3NDEsImV4cCI6MjAyNzY1MDc0MX0.Jp5cK5-k8FVrhEf8jvgQt2nnxDDBHYODtBedYMQt45s'
      );
    }
}