class String
  def masked_phone(char = "*")
    self[0, 5] + char * (length - 5 - 4) + self[-3, 3]
  end

  def masked(char = "*")
    return "*" * length if length < 8
    self[0, 4] + char * (length - 4 - 4) + self[-4, 4]
  end
end
