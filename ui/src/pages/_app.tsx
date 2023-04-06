import "@/styles/globals.css";
import type { AppProps } from "next/app";
import Head from "@/components/Head";
import "primereact/resources/themes/saga-blue/theme.css";
import "primereact/resources/primereact.min.css";
import "primeicons/primeicons.css";
// import "primeflex/primeflex.css";

export default function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <Head />
      <Component {...pageProps} />
    </>
  );
}
