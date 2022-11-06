module ArticlesHelper
  def posted_date(created_at)
    "at #{DateTime.parse(created_at).to_formatted_s(:long_ordinal)}"
  rescue StandardError
    ''
  end
end
