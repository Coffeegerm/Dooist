import { useState } from "react";
import { Button } from "primereact/button";
import useSwr from "swr";

export default function Home() {
  const [count, setCount] = useState(0);

  // const { data } = useSwr("todos", () =>
  //   fetch("/api/todos").then((res) => res.json())
  // );

  return (
    <div className="text-center">
      <h1>Dooist!</h1>
      <p>Do the dang thing.</p>
      <Button link>
        <a href="/login">Login</a>
      </Button>
    </div>
  );
}
