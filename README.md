# Brainfuck Interpreter in Haskell

This project is a Brainfuck interpreter written in Haskell. Brainfuck is an esoteric programming language with a minimalist design, and this interpreter allows you to run Brainfuck code using Haskell.

## Getting Started

### Prerequisites

To run this project, you need to have the Haskell installed on your machine.

### Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/Sang-it/brainfuck.git
   cd brainfuck
   ```

### Running the Interpreter

1. Open a terminal and navigate to the project directory.

2. Load the Haskell file into GHCi (the interactive Haskell interpreter):

   ```bash
   ghci
   ```

3. Once in the GHCi environment, load the `brainfuck.hs` file:

   ```haskell
   :l brainfuck.hs
   ```

4. Run the `main` function to start the interpreter:

   ```haskell
   main
   ```

### Example

After running the `main` function, you might enter the following Brainfuck code:

```plaintext
++++++++[>++++++++<-]>+.+.+.
```

This will output:

```plaintext
ABC
```

### Using GHCi Commands

Here are some useful GHCi commands:

- `:l <filename>`: Load the specified Haskell file.
- `:r`: Reload the current Haskell file.
- `:q`: Quit GHCi.

## Project Structure

- `brainfuck.hs`: The main Haskell file containing the Brainfuck interpreter implementation.

## Contact

For any questions or suggestions, please open an issue on the repository or contact me at rux12@icloud.com.

Enjoy interpreting Brainfuck in Haskell!
