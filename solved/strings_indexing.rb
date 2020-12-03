def serial_average(s)
  if s =~ /(\d{3})-(\d{2}\.\d{2})-(\d{2}\.\d{2})/
    serial = $1
    a = $2.to_f
    b = $3.to_f

    avg = (a+b)/2
    "#{serial}-%.2f" % avg.round(2)
  end
end
