import { Button } from "primereact/button";
import { InputText } from "primereact/inputtext";
import { useForm } from "react-hook-form";

export default function Login() {
  const { register, handleSubmit, formState } = useForm({
    defaultValues: {
      email: "",
      password: "",
    },
  });
  return (
    <form
      onSubmit={handleSubmit((data) => {
        console.log({ data });
        fetch("/api/auth/login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(data),
        });
      })}
    >
      <h1>Login to Dooist</h1>
      <div style={{ display: "flex", flexDirection: "column" }}>
        <InputText
          id="email"
          placeholder="john.doe@gmail.com"
          {...register("email", { required: true })}
        />
        <InputText
          id="password"
          {...register("password", { required: true, minLength: 6 })}
        />
        <Button type="submit" disabled={!formState.isValid}>
          Login
        </Button>
      </div>
    </form>
  );
}
