export async function getStaticProps() {
  // (In a real app, fetch data here if needed)
  return {
    props: { builtAt: new Date().toISOString() },
    revalidate: 60  // ISR: re-generate page at most once per 60 seconds
  };
}
