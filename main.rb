require 'date'

date = Date.today

Dir.mkdir(date.strftime('%Y-%m'), 0755)

y = date.strftime('%Y').to_i
m = date.strftime('%m').to_i

beginning_of_month = '01'
end_of_month = Date.new(y, m, -1).strftime('%d').to_s

month_days = (beginning_of_month..end_of_month).to_a

Dir.chdir(date.strftime('%Y-%m')) do
  month_days.each do |day|
    Dir.mkdir(day, 0755)
    File.open("./#{day}/README.md", 'w') do |file|
      file.puts ("# #{date.strftime('%Y-%m-')}#{day}")
    end
  end
end
