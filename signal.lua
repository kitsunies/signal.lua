local Connection = {}
Connection.__index = Connection

function Connection.new(signal, callback)
    local self = {
        signal = signal,
        callback = callback
    }
    return setmetatable(self, Connection)
end

function Connection:detach()
    if self.signal then
        self.signal.connections[self.callback] = nil
        self.signal = nil
        self.callback = nil
    end
end

local Signal = {}
Signal.__index = Signal

function Signal.new()
    local self = {
        connections = {}
    }
    return setmetatable(self, Signal)
end

function Signal:fire(...)
    for callback, run in pairs(self.connections) do
        callback(...)
        if run == "once" then
            self.connections[callback] = nil
        end
    end
end

function Signal:attach(callback)
    self.connections[callback] = true
    return Connection.new(self, callback)
end

function Signal:once(callback)
    self.connections[callback] = "once"
    return Connection.new(self, callback)
end

return setmetatable(Signal, {__call = Signal.new})
