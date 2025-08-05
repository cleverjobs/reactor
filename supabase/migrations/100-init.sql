-- Create example table
CREATE TABLE IF NOT EXISTS public.notes (
    id BIGSERIAL PRIMARY KEY,
    content TEXT
);

-- Enable Row-Level Security for the table (Supabase requires RLS on tables in public schema by default):contentReference[oaicite:23]{index=23}:contentReference[oaicite:24]{index=24}
ALTER TABLE public.notes ENABLE ROW LEVEL SECURITY;

-- Allow anonymous (unauthenticated) users to read all notes
CREATE POLICY "Allow read to anon" 
ON public.notes
FOR SELECT
USING (true);
