

liger1 = Liger.create!(birth_date: "1-1-2008".to_date, color: "rainbow", name: "Fred", sex: "?", description: "Fred is rainbow")
liger2 = Liger.create!(birth_date: "1-1-2007".to_date, color: "sparkly", name: "Marge", sex: "F", description: "Fred is rainbow")
liger3 = Liger.create!(birth_date: "1-1-2006".to_date, color: "shiny", name: "Bob", sex: "M", description: "Fred is rainbow")

request1 = LigerRentalRequest.create!(liger_id: liger1.id, start_date: "1-1-2008".to_date, end_date: "19-1-2008".to_date)
request2 = LigerRentalRequest.create!(liger_id: liger2.id, start_date: "1-1-2008".to_date, end_date: "21-1-2008".to_date)
request3 = LigerRentalRequest.create!(liger_id: liger3.id, start_date: "1-7-2008".to_date, end_date: "22-8-2008".to_date)
request4 = LigerRentalRequest.create!(liger_id: liger1.id, start_date: "1-1-2008".to_date, end_date: "19-1-2008".to_date, status: 'APPROVED')
request5 = LigerRentalRequest.create!(liger_id: liger1.id, start_date: "1-1-2007".to_date, end_date: "19-1-2007".to_date, status: 'APPROVED')
