# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#fixed this by adding dependent destroy in the relevent places
Organ.destroy_all
Component.destroy_all
User.destroy_all
UserOrgan.destroy_all
Requirement.destroy_all


#### ORGANS ####
#(held over ice...)#
liver = Organ.create(name: "Liver")
lung = Organ.create(name: "Lung")
heart = Organ.create(name: "Heart")
brain = Organ.create(name: "Brain")
skin = Organ.create(name: "Skin")
kidney = Organ.create(name: "Kidney")
eye = Organ.create(name: "Eye")
stomache = Organ.create(name: "Stomache")
l_intestine = Organ.create(name: "Long Intestine")
s_intestine = Organ.create(name: "Short Intestine")
tongue = Organ.create(name: "Tongue")
ear = Organ.create(name: "ear")
tooth = Organ.create(name: "tooth")
esophagus = Organ.create(name: "esophagus")
soul = Organ.create(name: "soul")
spirit = Organ.create(name: "spirit")

####COMPONENETS####

# => BIOLOGICAL <= #
mitochondria = Component.create(name: "Mitochondria", price: 400, missing_error: "Needs more energy")
nucleus = Component.create(name: "Nucleus")
blood = Component.create(name: "Blood")
cell = Component.create(name: "Cell",
price: 100,
missing_error: "Needs more cytoplasm")
#hepatocyte = Component.create(name: "Hepatocyte")
#neurons = Component.create(name: "neurons")

# => NON-Biological
fan = Component.create(name: "fan",
price: 200,
missing_error: "Smell stuffy in here")
led = Component.create(name: "l.e.d",
price: 100,
missing_error: "Too dark to see")
anti_freezeer = Component.create(name: "anti freeze")
batteries = Component.create(name: "batteries")
timer = Component.create(name: "timer")
nanobots = Component.create(name: "nanobots")


##requirements
liver.components << [cell, fan, led]
# Requirement.create(organ_id: liver.id, component_id: cell.id)

## Users ##
eric = User.create(
  username: "daily_showers",
  password: "abc",
  balance: 500.01
)
chris = User.create(
  username: "chris",
  password: "abc",
  balance: 500.01
)

## User_Organs ##

erics_liver = UserOrgan.create(user: eric, organ: liver)
