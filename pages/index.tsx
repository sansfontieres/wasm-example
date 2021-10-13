import type { NextPage } from "next";
import dynamic from "next/dynamic";

const number = 8;

const WasmComponent = dynamic({
  loader: async () => {
    const wasmModule = await import("../wasm-example.wasm");
    return () => <div>Square of {number}: {wasmModule.square(number)}</div>;
  },
});

const Home: NextPage = () => {
  return (
    <>
      <div>
        <WasmComponent />
      </div>
    </>
  );
};

export default Home;
