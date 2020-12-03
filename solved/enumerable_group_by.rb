def group_by_marks(marks, pass_marks)
  marks.group_by do |k,v|
    unless k.nil?
      if v >= pass_marks
        "Passed"
      else
        "Failed"
      end
    end
  end
end
