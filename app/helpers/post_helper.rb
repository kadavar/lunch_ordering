module PostHelper
  def options_for_post_food(default_course)
    options_for_select([['First course', 'first'], ['Second course', 'second'], ['Drink', 'drink']], default_course)

  end

end