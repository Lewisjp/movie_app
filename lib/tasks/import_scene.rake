require 'csv'

desc "Import teams from csv file"
task :import_this => [:environment] do

  file = "db/scenedata.csv"

  CSV.foreach(file, :headers => true) do |row|
    Scene.create ({
      :title => row[0],
      :year => row[1],
      :IMDB => row[2],
    })
  end

end