module Helpers
  def clean_quotes(string)
    return "" if string.nil?

    if string.start_with?('"') && string.end_with?('"') && string.length >= 2
      return string[1..-2]
    else
      return string
    end
  end
end