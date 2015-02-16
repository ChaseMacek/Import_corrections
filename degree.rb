require "csv"

contents = CSV.open "standard.csv", headers: true, header_converters: :symbol
contents.each do |row|

  degree = row[:degree]

  degree_correction = degree.gsub(/M.D./, "MD")
  .gsub(/M.D/, "MD")
  .gsub(/PhD/, "PHD")
  .gsub(/Ph.D./, "PHD")
  .gsub(/D.O./, "DO")
  .gsub(/PsyD/, "PSYD")
  .gsub(/Psy.D./, "PSYD")
  .gsub(/Psy D/, "PSYD")

  CSV.open("degree_correction.csv", "a+") do |csv|
    csv << [degree_correction]
  end
end
