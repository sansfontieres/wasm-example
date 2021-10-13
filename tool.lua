#!/usr/bin/env lua

local function build ()
  local f = io.open("build.ninja", "w")
  print("Generating build file for ninja")
  local rules = [[
rule zigc
  command = zig build-lib $in -target wasm32-freestanding -dynamic -OReleaseSmall
build wasm-example.wasm: zigc wasm-example.zig
]]
  f:write(rules);
  f:close();
  print("running samu")
  os.execute("samu") -- Feel free to use ninja or just build by hand.
end

build()
