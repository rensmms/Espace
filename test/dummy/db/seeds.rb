contacts_list = [
    [ "RENARD", "Olivier" ],
    [ "DUPONT", "dupont" ],
    [ "MONROE", "Maryline" ]
]

contacts_list.each do |name, v|
  Contact.create( name: name )
end