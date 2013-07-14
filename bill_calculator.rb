puts "Please input the basket details\nFor Example: 1 book at 12.4\n1 imported box of chocolates at 10.00"
puts "Press E to end the input"
exempt_tax_items=['chocolates','chocolate','pills','books','book']
sales_tax=0
total=0
input_basket=[]
100.times do
  flag=0
  each_item=gets.chomp
  break if each_item == 'E'
  each_item=each_item.split(' ')
  input_basket << each_item
  no_of_item=each_item.first.to_f
  price=each_item.last.to_f

  exempt_tax_items.each do |item|
    flag=1 if each_item.include? item
  end
  if flag == 0
    each_item[-1]=sprintf("%.2f",(each_item[-1].to_f+(((no_of_item*price*0.1*20).ceil)/20.0 )))
    sales_tax+=((no_of_item*price*0.1*20).ceil)/20.0
  end
  if each_item.include? 'imported'
    #p ((price*0.05*20).round)/20.0
    each_item[-1]=sprintf("%.2f",(each_item[-1].to_f+(((no_of_item*price*0.05*20).ceil)/20.0 )))
    #p each_item[-1]
    sales_tax+=((no_of_item*price*0.05*20).ceil)/20.0
  end
  total+=each_item[-1].to_f
  each_item.map! { |x| x == 'at' ? ':' : x }
end
input_basket.each do |t|
  puts t.join(' ')
end
printf("Sales Taxes: %.2f\n",sales_tax)
printf("Total: %.2f",total)