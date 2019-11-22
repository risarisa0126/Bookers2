module ApplicationHelper
	def page_title
    title = "Bookers2"
    title = @page_title + " | " + title if @page_title
    title
  end
end
