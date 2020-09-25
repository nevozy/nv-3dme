resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description "Nevo's 3dme"

client_script "@nevo-scripts/cl_errorlog.lua"


client_script 'client.lua'
server_script 'server.lua'

files {
	"html/index.html",
	"html/js.js"
}

ui_page {
	'html/index.html',
}
