-- Shims for WoW 3.3.5a and other clients without retail APIs.

if (not _G.Mixin) then
  function _G.Mixin (object, ...)
    for i = 1, select('#', ...) do
      local mixin = select(i, ...);

      if (mixin ~= nil) then
        for k, v in pairs(mixin) do
          object[k] = v;
        end
      end
    end

    return object;
  end
end

if (not _G.CreateFromMixins) then
  function _G.CreateFromMixins (...)
    return _G.Mixin({}, ...);
  end
end

if (not _G.C_Timer) then
  _G.C_Timer = {};
end

if (not _G.C_Timer.After) then
  local tinsert = _G.tinsert;
  local tremove = _G.tremove;
  local GetTime = _G.GetTime;
  local timerFrame = _G.CreateFrame('Frame');
  local queue = {};

  function _G.C_Timer.After (delay, func)
    delay = tonumber(delay) or 0;
    tinsert(queue, {
      t = GetTime() + delay,
      f = func,
    });

    timerFrame:SetScript('OnUpdate', function ()
      local now = GetTime();
      local i = 1;

      while (i <= #queue) do
        local entry = queue[i];

        if (now >= entry.t) then
          entry.f();
          tremove(queue, i);
        else
          i = i + 1;
        end
      end

      if (#queue == 0) then
        timerFrame:SetScript('OnUpdate', nil);
      end
    end);
  end
end

do
  local proto = _G.CreateFrame('Frame');

  if (proto.SetSize == nil) then
    local meta = getmetatable(proto);

    if (meta and meta.__index and meta.__index.SetSize == nil) then
      local idx = meta.__index;

      function idx:SetSize (width, height)
        self:SetWidth(width);
        self:SetHeight(height);
      end
    end
  end
end
