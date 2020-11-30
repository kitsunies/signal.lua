<h1 align=center>signal.lua 🛰️</h1>
<h3 align=center>An event module made to attach and emmit singals 📡</h3>

# Example

```lua
local event = require("signal")()

event:on(function()
    print("I've been fired! 🚀")
end)

event:fire()
--> "I've been fired! 🚀"
```

# Installation

## Luarocks

If you are using [luarocks](https://luarocks.org), just run:

```
luarocks install signalise
```

## Manual

Copy the [signal.lua](signal.lua) file somewhere where your Lua interpreter will be able to find it and require it accordingly:

```lua
local signal = require("signal")
```

# Interface

### Creation

```lua
local event = signal.new()
```
or
```lua
local event = signal()
```

Creates and returns the event. It must be captured in a variable a in order for the events to take place.

- `event` is the object that must be used to perform the events - see the ["Event methods"](#Event-Methods) section below.

### Firing

```lua
event:fire([...])
```

Triggers the event, allowing for connections to run once until the event is fired again.

- `event` - An event returned by [`signal.new`](#Event-Creation)
- `...` - The optional arguments to be used for the connections

### Attaching

```lua
local connection = event:attach(callback)
```

Executes the given callback function whenever the connected event gets fired with the [`event.fire`](#Firing) method.

- `event` - An event returned by [`signal.new`](#Event-Creation)
- `callback` - Must be a function, exectuted when the event gets fired
- `connection` - The returned connection

### Attach Once

```lua
local connection = event:once(callback)
```

Works almost identically to [`event.fire`](#Firing), but only fires once before self detaching.

- `event` - An event returned by [`signal.new`](#Event-Creation)
- `callback` - Must be a function, exectuted when the event gets fired
- `connection` - The returned connection

### Detaching

```lua
connection:detach()
```

Concludes the usage of the given connection object.

- `connection` is the object that is fundamental for executing callbacks

# Testing
Install busted & luacheck `luarocks install busted && luarocks install luacheck` and run:

```
$ busted
$ luacheck signal.lua
```

# License

This library is free software; you can redistribute and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.
