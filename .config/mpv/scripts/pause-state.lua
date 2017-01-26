pause_state_file = '/home/amar/.local/share/mpv/pause-state.txt' -- Make sure this dir exists

function on_loaded(event)
	local file = assert(io.open(pause_state_file, 'w'))
	file:write('false')
	file:close()
end

function on_end(event)
	local file = assert(io.open(pause_state_file, 'w'))
	file:write('')
	file:close()
end

function on_pause_change(name, value)
	local file = assert(io.open(pause_state_file, 'w'))
	file:write(value and 'true' or 'false')
	file:close()
end

mp.register_event('file-loaded', on_loaded)
mp.register_event('end-file',   on_end)
mp.observe_property('pause', 'bool', on_pause_change)
