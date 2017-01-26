scrobble_file = '/home/amar/.local/share/mpv/scrobble.txt' -- Make sure this dir exists

paused  = false
playing = ''

function update_file()
	local file = assert(io.open(scrobble_file, 'w'))
	file:write(paused and '  ' or '  ', playing)
	file:close()
end

function clear_file()
	local file = assert(io.open(scrobble_file, 'w'))
	file:write('')
	file:close()
end

function on_loaded(event)
	local data = mp.get_property_native('metadata')
	local artist = data and data['artist']

	playing = ''

	if artist and string.len(artist) > 0 then
		playing = artist .. ' - '
	end

	playing = playing .. mp.get_property('media-title')

	update_file()
end

function on_end(event)
	clear_file()
end

function on_pause_change(name, value)
	paused = value
	update_file()
end

mp.register_event('file-loaded', on_loaded)
mp.register_event('metadata-update', on_loaded)
mp.register_event('end-file',   on_end)
mp.observe_property('pause', 'bool', on_pause_change)
