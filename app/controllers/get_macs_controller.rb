class GetMacsController < ApplicationController
  def create
  end
end

# Started POST "/get_macs.json" for 192.168.2.1 at 2016-04-14 09:22:07 +0800
# Cannot render console from 192.168.2.1! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Processing by GetMacsController#create as JSON
  # Parameters: {"mac"=>"00:11:22:33:44:55", 
                       # "1"=>"{\"mac\":\"0e:07:23:2b:14:c2\",\"db\":\"-62\"}", 
                       # "2"=>"{\"mac\":\"0c:84:dc:f7:bf:29\",\"db\":\"-61\"}",  
                       # "3"=>"{\"mac\":\"64:cc:2e:6d:64:3e\",\"db\":\"-67\"}", 
                       # "4"=>"{\"mac\":\"00:27:10:87:5d:04\",\"db\":\"-64\"}", 
                       # "5"=>"{\"mac\":\"24:09:95:21:6c:50\",\"db\":\"-65\"}"}

