import Head from "next/head";

export default function HEAD() {
  return (
    <Head>
      <title>Dooist</title>
      <meta name="description" content="Totally not a Todoist clone" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="icon" href="/favicon.ico" />
    </Head>
  );
}
