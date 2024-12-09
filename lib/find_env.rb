class FindEnv
  def self.find_ruby_files
    Dir.glob("./**/**/**/*.rb")
  end

  def self.find_env_variables
    file_names=find_ruby_files
    env_vars=[]
    puts file_names

    file_names.each do |file|
      File.foreach(file).with_index do |line,line_num|
        next if line.strip.empty? || line.strip.start_with?("#")

        matches =line.scan(/ENV\["(.*?)"\]|ENV\['(.*?)'\]|ENV\.fetch\(["'](.*?)["']\)/)

        matches.flatten.compact.each do |env_var|
          env_vars << {variable:env_var,file:file,line:line_num+1}
        end

      end
    end
    env_vars
  end
end


results =FindEnv.find_env_variables
results.each do |entry|
  puts "Varible:#{entry[:variable]} | File:#{entry[:file]}} | Line: #{entry[:line]}"
end