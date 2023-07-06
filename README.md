# money-convertion-cli
Uma cli para conversão de moedas feito em Ruby

## Install

```bash
git clone https://github.com/lu-css/money-convertion-cli
cd money-convertion-cli
chmod u+x ./main.rb
```

## Usage

```bash
./main.rb {symbol} [value]
```

if `value` is not present, 1 is used

`symbol` is the coin.

### Example

```bash
./main.rb brl 2 
```

See 2 Dolars in Real

## Create a alias

Add the following code to the `.bashrc` or `.zshrc`

```bash
alias money="path/to/main.rb"
```
