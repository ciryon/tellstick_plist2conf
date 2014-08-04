# tellstick_plist_converter.rb
# Written by Christian Hedin
# ciryon[at]mac[dot]com
#
file = File.open("com.telldus.core.text.plist")

key = ""
val = ""
device_id = ""
parameters = ""

devices_hash = Hash.new

file.each do |line|
  if line =~ /<key>devices\.(\d+)\.(parameters\.)*(.*)<\/key>/
    device_id = $1
    parameters = $2
    key = $3

  else

    if line =~ /<.*>(.*)<\/.*>/
      val = $1
    end
  end

  #puts "DEVICE #{device_id}: #{key} -> #{val}"
  if ! devices_hash[device_id]
    devices_hash[device_id] = Hash.new
  end
  if parameters
    if ! devices_hash[device_id]['parameters']
     devices_hash[device_id]['parameters'] = Hash.new
    end
    devices_hash[device_id]['parameters'][key] = val
  else
    devices_hash[device_id][key] = val
  end


end

devices_hash.each do |device_id,val_hash|
  puts "device {"
  puts "  id = #{device_id}"
  val_hash.each do |key,val|
    if key == "parameters"
      puts "  parameters {"
      val.each do |parameter_key,parameter_val|
        puts "    #{parameter_key} = \"#{parameter_val}\""
      end
      puts "  }"
    else
      puts "  #{key} = \"#{val}\""
    end
  end
  puts "}\n"
end
