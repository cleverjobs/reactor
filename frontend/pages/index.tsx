// pages/index.js
export async function getServerSideProps() {
  // Fetch notes via Supabase REST API (server-side)
  const res = await fetch(`http://${process.env.SUPABASE_INTERNAL_HOST}:8000/rest/v1/notes?select=*`, {
    headers: {
      apikey: process.env.SUPABASE_SERVICE_ROLE_KEY,
      Authorization: `Bearer ${process.env.SUPABASE_SERVICE_ROLE_KEY}`
    }
  });
  const notes = await res.json();
  return { props: { notes } };
}
