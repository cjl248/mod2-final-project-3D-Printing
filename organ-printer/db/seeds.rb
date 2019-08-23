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
liver = Organ.create(name: "Liver",
minimum_component_count: 5,
image: "https://scotthull.files.wordpress.com/2007/01/hull-pictures-002.jpg")
lung = Organ.create(name: "Lung",
minimum_component_count: 3,
image: "http://3.bp.blogspot.com/-P4Pini1ZNiE/UGDqjFwnGNI/AAAAAAAAAA8/oFcqC76NreI/s1600/cow+lungs.jpg")
heart = Organ.create(name: "Heart",
minimum_component_count: 3,
image: "https://66.media.tumblr.com/088d0a343b95a732b8183eacc2daa020/tumblr_n17dkjrn3e1ramatho2_500.jpg")
brain = Organ.create(name: "Brain",
minimum_component_count: 8,
image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREUfAhLf5atqGNZZSynu8Sn_SQUOA5cX8AlmQRlo04msbH6n1g")
skin = Organ.create(name: "Skin",
minimum_component_count: 6,
image: "http://cdn.shopify.com/s/files/1/0414/6449/files/forgacs_cultured_leather_large.jpg?v=1483754456")
eye = Organ.create(name: "Eye",
minimum_component_count: 7,
image: "https://blog.nationalgeographic.org/wp-content/uploads/2012/10/giant-eyeball1.jpg")
stomach = Organ.create(name: "Stomach",
minimum_component_count: 3,
image: "https://tse4.mm.bing.net/th?id=OIP.oR29-vd-O9nunm6Vu5qErgHaE8&pid=Api&P=0&w=300&h=300")
tongue = Organ.create(name: "Tongue",
minimum_component_count: 3,
image: "https://static.turbosquid.com/Preview/2014/07/09__22_36_02/Alternate2_View.jpged9f722d-a68c-41f4-ad63-a6efbc0456a2Original.jpg")
ear = Organ.create(name: "ear",
minimum_component_count: 8,
image: "https://cdn1.alphr.com/sites/alphr/files/2016/02/ear.jpg")
tooth = Organ.create(name: "tooth",
minimum_component_count: 2,
image:"https://www.chichesterinc.com/Images2016/174-360-Lg.jpg")
esophagus = Organ.create(name: "esophagus",
minimum_component_count: 4,
image: "https://cbsnews1.cbsistatic.com/hub/i/r/2011/07/08/075b766e-a644-11e2-a3f0-029118418759/thumbnail/1200x630/acac6f50242330b4d9d92749fd34bd58/windpipe-2.jpg")
soul = Organ.create(name: "soul",
minimum_component_count: 9,
image: "https://cdn.newspunch.com/wp-content/uploads/2016/01/science-soul.jpg")
spirit = Organ.create(name: "spirit",
minimum_component_count: 12,
image: "https://thepassionists.org/uploads/post/image/1468/iStock_49594202_SMALL.jpg")

####COMPONENETS####

# => BIOLOGICAL <= #
mitochondria = Component.create(name: "Mitochondria", price: 100, missing_error: "Needs more energy")
nucleus = Component.create(name: "Nucleus", price: 50, missing_error: "Missing DNA" )
blood = Component.create(name: "Blood", price: 100, missing_error: "Too dry to function." )
cell = Component.create(name: "Cell", price: 100, missing_error: "Needs more cytoplasm.")
hepatocyte = Component.create(name: "Hepatocytes", price: 150, missing_error: "Unable to perform protein synthesis.")
neuron = Component.create(name: "Neurons", price: 400, missing_error: "Need a tool to build a network." )
collagen = Component.create(name: "collagen", price: 700, missing_error: "Wrinkles already appearing" )
squamous = Component.create(name: "Squamous cells", price: 111,
missing_error: "Not enough lubrication - excessive frictions is eroding vessels" )
cones = Component.create(name: "Cone cells", price: 174,
missing_error: "Everything is in black & white!!! Need colour!!!!" )
melanin = Component.create(name: "Melanin", price: 352,
missing_error: "Excessivley prone to sun damage" )
stereocilia= Component.create(name: "Stereocilia", price: 12.87,
missing_error: "Unable to process vibrations" )
gustatory_cells = Component.create(name: "Gustatory Cells", price: 98.87,
missing_error: "Can't taste anything" )

# => NON-Biological
fan = Component.create(name: "fan", price: 200, missing_error: "Smell stuffy in here")
led = Component.create(name: "LED bulbs", price: 100, missing_error: "Too dark to see")
anti_freeze = Component.create(name: "Anti Freeze", price: 100,
missing_error: "This organ will be unable to withstand the impact of drinking a slushie")
batteries = Component.create(name: "Nucleur Batteries", price: 700,
missing_error: "artificial source of energy needed to power this organ")
timer = Component.create(name: "Alarm Clock", price: 80, missing_error: "Unable to exit resting stage without artificial interference")
nanobots = Component.create(name: "nanobots", price: 700, missing_error: "More precise builders needed to implement quantum functionality")
dehumidifier = Component.create(name: "dehumidifier", price: 700, missing_error: "Mold is accumulating at a lethal rate")
brita_filter = Component.create(name: "Brita Filter", price: 200, missing_error: "Need method of expelling toxins from cytoplasm")
crazy_glue = Component.create(name: "Crazy Glue", price: 35,
missing_error: "Things are falling apart.")
hydraulic_jack = Component.create(name: "Hydraulic Jack", price: 35,
missing_error: "Need help expanding and contracting")


##requirements
liver.components << [mitochondria, fan, hepatocyte]
lung.components << [hydraulic_jack, squamous]
heart.components << [blood, crazy_glue, hydraulic_jack]
brain.components << [anti_freeze, neuron, nucleus, timer]
skin.components << [cell, collagen, brita_filter, melanin]
eye.components << [brita_filter, led, cones, melanin]
stomach.components << [dehumidifier, led, anti_freeze]

tongue.components << [gustatory_cells, brita_filter]
ear.components << [led, stereocilia, fan]
tooth.components << [crazy_glue]
esophagus.components << [brita_filter, crazy_glue, blood]
soul.components << [batteries, timer, nanobots]
spirit.components << [batteries, timer, nanobots]


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
erics_tooth = UserOrgan.create(user: eric, organ: tooth)
UserOrgan.create(user: eric, organ: heart)
eric.user_organs.create(organ:brain)
eric.user_organs.create(organ:soul)
eric.user_organs.create(organ:spirit)
eric.user_organs.create(organ:eye)
eric.user_organs.create(organ:stomach)
eric.user_organs.create(organ:ear)
