class String
  def id?
    (self =~ /^[1-9]+[0-9]*$/).nil? ? false : true
  end
end