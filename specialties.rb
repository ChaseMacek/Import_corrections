require "csv"

contents = CSV.open "standard.csv", headers: true, header_converters: :symbol
contents.each do |row|

  specialty = row[:specialty_1]

  specialty_correction = specialty.gsub(/Clinical Psychologist/, "Clinical Psychology")
  .gsub(/Colorectal Surgery/, "Colon and Rectal Surgery")
  .gsub(/Diabetes, Metabolism, and Endocrinology/, "Diabetes, Endocrinology and Metabolism")
  .gsub(/Family Medicine/, "Family Practice")
  .gsub(/Physical Medicine and Rehabilitation/, "Physical Medicine and Rehabilitation (physiatry)")

  CSV.open("corected_specialties.csv", "a+") do |csv|
    csv << [specialty_correction]
  end
end
