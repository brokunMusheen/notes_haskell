# Introduction
In impertive languages such as C++, you tell the computer what to do. In functional languages such as Haskell, you tell the computer what something *is* - expressed as a function.

## Haskell is:
**Referentially Transparent**: A function that returns the same result upon multiple calls when given the same the same arguments is said to be referentially transparent.

**Lazy**: Function evaluation is deferred to the last minute and will calculate only what is necessary to return a result. This means that Haskell can optimize operations in certain scenarios, as well as take advantage of things like infinitely sized lists.

## Running Examples
Install the [Haskell Platform](https://www.haskell.org/downloads)

Once the platform is installed, you may run the following commands from your terminal:

* To run a basic Haskell REPL:
    * `ghci`

* To load a Haskell script within GHCi:
    * `:l <script_name>.hs`

* To reload a script already loaded within GHCi:
    * `:r` or `:l <script_name>.hs`
