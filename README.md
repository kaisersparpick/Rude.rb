# Rude.rb
Rude.rb is a **Ruby** implementation of the *rule-based dispatcher* control-flow pattern [Rude](https://github.com/kaisersparpick/Rude).

## Usage

#### Creating an instance
```ruby
require_relative "rude.rb"
rude = Rude.new()
```

#### Adding a rule

```ruby
inst = SomeClass.new()
rude.add_rule(inst.method(:methodname1), inst.method(:methodname2), inst.method(:methodname3))
```
`add_rule` accepts three arguments: the condition to check, the function to call when the result is true, and the function to call when it is false. Each argument is a function reference or `nil`.

The return value of conditions must be `true` for proceeding with the yes callback and `false` with the no branch. When a condition returns `nil`, Rude exits the condition chain. In this case, the yes and no callbacks are not necessary. These conditions are usually exit points.

#### Checking conditions

Checking conditions based on the applied rules is triggered by calling `rude.check()`.

```ruby
rude.check(inst.method(:methodname1))
```

This specifies the entry point in the condition chain and can be set to any valid rule condition.

## Example

The example provided is a subprocess launcher. It shows how to encapsulate the control flow logic for determining how to launch a subprocess in Ruby. It is based on the flow chart at https://stackoverflow.com/a/30463900
