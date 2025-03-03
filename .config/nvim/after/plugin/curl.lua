local status_ok, curl = pcall(require, "curl")
if not status_ok then
	return
end

curl.setup({})
