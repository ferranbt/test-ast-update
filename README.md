## Foundry

Reproduction for AST not being updated.

Compile the first test:

```bash
$ forge test --match-test test_Increment --match-path test/Counter.t.sol --ast
```

The `Other.sol` file gets compiled even though it is not imported in `Counter.t.sol`.

```bash
$ ls out/Other.sol
```

Now, test the `Other.t.sol` file:

```bash
$ forge test --match-test test_Other --match-path test/Other.t.sol --ast
```

The `Other.t.sol` file gets compiled, but the AST for the `Other.sol` file is not updated. `Other.t.sol` references ids that are not present in the `Other.sol` file because it still uses the old AST version.

Check the id of the exported `Other` symbol in `Other.sol`:

```bash
$ cat out/Other.sol/Other.json | jq ".ast.exportedSymbols.Other.[0]"
```

which does not match with the id used in `Other.t.sol` to reference the `Other` contract.

```
$ cat out/Other.t.sol/OtherTest.json | jq ".ast.exportedSymbols.Other.[0]"
```
