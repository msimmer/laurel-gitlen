module ApplicationHelper
  def date_markup(exhibition, line_break=false)
    if exhibition.begins.year == exhibition.ends.year
      "#{exhibition.begins.strftime('%m.%d')}&mdash;#{'<br/>' if line_break}#{exhibition.ends.strftime('%m.%d.%y')}"
    else
      "#{exhibition.begins.strftime('%m.%d.%y')}&mdash;#{'<br/>' if line_break}#{exhibition.ends.strftime('%m.%d.%y')}"
    end
  end
end
