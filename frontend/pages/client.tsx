// pages/client.js (excerpt)
import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);

export default function ClientPage() {
  const [notes, setNotes] = useState([]);
  useEffect(() => {
    supabase.from('notes').select('*').then(result => {
      if (result.error) console.error(result.error);
      else setNotes(result.data);
    });
  }, []);
  // ...
}
