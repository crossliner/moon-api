-- api wrapper
local PORT = 1984; 

local request = syn.request or http.request or http_request or request;
assert(request, "Unsupported");

local function compile(source) 
  local res = request({
    Method = "POST",
    Body = source,
  })
end;

getgenv().moon = {
  execute = function(source) 
    return self.load(source)(); -- doesnt exactly execute it
  end;

  load = function(str) 
    return loadstring(compile(str));
  end;

  compile = compile;
};

-- made by niggers 2021