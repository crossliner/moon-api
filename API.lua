-- api wrapper
local PORT = 1984; --// change if needed

local request = syn.request or http.request or http_request or request;
assert(request, "Unsupported");

local function compile(source) 
  local res = request({
    Method = "POST",
    Url = ("http://localhost:%d/compile"):format(PORT),
    Body = source,
    Headers = {
      ["Content-Type"] = "text/plain"
    }
  });

  return res.Body;
end;

getgenv().moon = {
  execute = function(source) 
    return self.load(source)(); --// doesnt exactly execute it
  end;

  load = function(str) 
    return loadstring(compile(str));
  end;

  compile = compile;

  loadfile = function(file)
    return self.load(readfile(file));
  end;
};