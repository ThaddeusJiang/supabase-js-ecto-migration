import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

// Create a single supabase client for interacting with your database
const supabase = createClient(
  "http://127.0.0.1:54321",
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0"
);

const { data, error } = await supabase.from("role").select(`
    id,
    name,
    permissions:permission (id ,entity, action, access)
`);

if (error) {
  console.log(error);
}

console.log(data);
