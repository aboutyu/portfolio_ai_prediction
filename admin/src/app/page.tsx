import Image from "next/image";
import SignInForm from "@/components/auth/SignInForm";

export default function Home() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-2 dark:bg-black">
        <SignInForm />
      </div>
  );
}
