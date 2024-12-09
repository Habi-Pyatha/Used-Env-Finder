class FindEnv
  # require("env_gem.rb")

  # Env_list.load_env
  def self.find_env
    # return Dir["/path/to/search/**/*.rb"]
    # Dir.entries(".")
    Dir["./**/**/*"]
    
  end
end
arr=[]
FindEnv.find_env.each do |rb| 
  if rb.split(".").last=="rb"
    arr.push(rb)
  end
end

# puts arr



