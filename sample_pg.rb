require 'pg'
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  no_myself_results = connection.exec("SELECT * FROM crops WHERE give_for <> '自家消費';")

  no_myself_results.each do |record1|
    puts "ゴーヤの長さ：#{record1["length"]}　重さ：#{record1["weight"]} 質：#{record1["quality"]} 販売先:#{record1["give_for"]} 販売日:#{record1["date"]}"
  end

  quality_results = connection.exec("SELECT * FROM crops WHERE quality = false;")

  quality_results.each do |record2|
    puts "ゴーヤの長さ：#{record2["length"]}　重さ：#{record2["weight"]} 質：#{record2["quality"]} 販売先:#{record2["give_for"]} 販売日:#{record2["date"]}"
  end

ensure
  connection.finish
end