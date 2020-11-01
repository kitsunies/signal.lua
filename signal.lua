local Connection = {}
Connection.__index = Connection

function Connection.new(signal, func)
    local self = {
        signal = signal,
        callback = callback
    }

    return setmetatable(self, Connection)
end

function Connection:disconnect()
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
        connections = {},
    }
    
    return setmetatable(self, Signal)
end

function Signal:fire(...)
    for func, _ in pairs(self.connections) do
        func(...)
    end
end

function Signal:connect(func)
    self.connections[func] = true
    return Connection.new(self, func)
end  

return Signal
