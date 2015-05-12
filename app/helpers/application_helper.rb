module ApplicationHelper

  def formatted_date(date)
    date.strftime("%d-%b %Y")
  end

  def formatted_time(date)
    date.strftime("%I:%M %p")
  end

end
