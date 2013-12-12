module ApplicationHelper
  def date_markup(exhibition)
    if exhibition.begins.year == exhibition.ends.year
      "#{exhibition.begins.strftime('%m.%d')}&mdash;<br/>#{exhibition.ends.strftime('%m.%d.%y')}"
    else
      "#{exhibition.begins.strftime('%m.%d.%y')}&mdash;<br/>#{exhibition.ends.strftime('%m.%d.%y')}"
    end
  end
end
