# encoding: utf-8
# Start at creating a namespace
namespace :db do
  desc "Fill database with initial data"
  # Ensure that the Rake task has access to the local Rails environment.
  task init_data: :environment do
    make_admins
    build_default_focus_content
    build_default_categories
  end

  task grab_professor_works: :environment do
    grab_professor_works_from_original_site
  end
end

def make_admins
  # User.create! raises an exception for an invalid user rather than
  # returing false
  Admin.create!(email: "102938002@ntut.edu.tw", password: "lab635") if Admin.all.count == 0
end

def build_default_focus_content
  if Focus.all.count == 0
    Focus.create!(content: "本實驗室中心的宗旨在於提昇國內商業智慧管理的學術與實務水準，在理念上主張理論與實務並重，務求學術研究和專業訓練間的均衡發展，且將本著社會整體需求，力求資源整合，結合理論與實務，以培育商業智慧技術專業人才。")
  end
end

def build_default_categories
  Category.create!( [{name: "期刊論文"}, {name: "研討會論文"}, {name: "專書及專書論文"}, 
                     {name: "技術報告及其他"}] ) if Category.all.count == 0
end

def grab_professor_works_from_original_site
  require 'open-uri'

  url = "http://140.124.77.221/lab635/professer1.html"
  # Nokogiri: a great tool for grabbing HTML content
  doc = Nokogiri::HTML(open(url))

  categories = []

  doc.css(".style61").each do |category|
    categories << category.text.strip
  end

  doc.css("table").each_with_index do |table, i|
    category = Category.find_by_name(categories[i])

    # Reverse makes the data to insert the titles by date
    table.css("tr td:nth-child(2)").reverse.each do |data|
      work = category.works.build(title: data.at_css("p").text)
      work.save!
    end
  end
end