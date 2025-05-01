module Helpers
  def clean_quotes(string)
    return "" if string.nil?

    cleaned = if string.start_with?('"') && string.end_with?('"') && string.length >= 2
      string[1..-2]
    else
      string
    end
    cleaned.gsub("·", " ")
  end
end