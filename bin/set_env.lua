-- Sets the following properties to be used in the nginx.conf
-- vcap.application.instance_id
-- vcap.service.{{Service_name}}.credentials.{{prop}} for each service
local cjson = require "cjson"


local vcap_services = cjson.decode(os.getenv("VCAP_SERVICES"));

for service_name, services in pairs( vcap_services) do
   for id, service in pairs(services) do
   		for prop, value in pairs(service.credentials) do
   			print('export vcap_service_' .. service.name .. '_credentials_' .. prop ..'="' .. value..'"');
   		end
   end
end