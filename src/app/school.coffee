class School extends window.App.Model
  constructor: (opts) ->
    super opts

  @url: 'schools'

  fromJSON: (data) =>
    @[key] = value for key, value of data when key isnt 'projects'

  @imageForDonationType:(don)=>
    don = don.replace(/\s/g,"") 
    types=
      "soccerballs" : 'Soccer-Ball'
      "laptops"      : 'Laptop'
      "schoolsupplies" : "School-Supplies"
      "bras" : "Bra"
      "books": "Book"

    console.log don, types[don]

    types[don]
window.App.School = School
