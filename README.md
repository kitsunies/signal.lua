<h1 align=center>signal.lua 🛰️</h1>
<h3 align=center>An event module made to attach and emmit singals 📡</h3>

# Installation

## Luarocks

If you are using [luarocks](https://luarocks.org), just run:

```
luarocks install signalise
```

## Manual

Copy the [signal.lua](signal.lua) file somewhere where your Lua interpreter will be able to find it and require it accordingly:

```lua
local signal = require('signal')
```

# Interface

## Event Creation

```lua
local event = require('signal').new()
```

Creates a new event.

- `event` is the object that must be used to perform the events - see the ["Event methods"](#Event-Methods) section below.

This method only creates and returns the tween. It must be captured in a variable a in order for the events to take place.

## Event Methods

### Firing

```lua
event:fire([...])
```

Fires the event.

- `event` is an event returned by [`signal.new`](#Event-Creation)
- `...` are the optional arguments to be used for the connections

This method triggers the event, allowing for connections to run once until the event is fired again.

### Connecting

```lua
local connection = event:connect(callback)
```

Runs a function when a certain event is fired.

- `event` is an event returned by [`signal.new`](#Event-Creation)
- `callback` must be a function, it is exectuted when the event gets fired
- `connection` is the returned connection

This method executes the given callback function whenever the connected event gets fired with the [`event:fire`](#Firing) method.

### Disconnecting

```lua
connection:disconnect()
```

Disables usage of a connection.

- `connection` is the object that is fundamental for executing callbacks

This method concludes the usage of the given connection object.

# License

This library is free software; you can redistribute and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.
