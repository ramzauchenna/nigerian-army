# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Centre.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('centres_id_seq', 1)")
Lga.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('lgas_id_seq', 1)")
Subject.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('subjects_id_seq', 1)")
Grade.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('grades_id_seq', 1)")
ArmyCorp.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('army_corps_id_seq', 1)")
Specialization.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('specializations_id_seq', 1)")
Qualification.delete_all
ActiveRecord::Base.connection.execute("SELECT SETVAL('qualifications_id_seq', 1)")

config = YAML::load_file(File.join(Rails.root, 'db', 'seed.yml'))
Centre.create(config["centres"])
Subject.create(config["subjects"])
Grade.create(config["grades"])
ArmyCorp.create(config["army_corps"])
Specialization.create(config["specializations"])
Qualification.create(config["qualifications"])

config_n = YAML::load_file(File.join(Rails.root, 'db', 'ngrlga.yml'))
Lga.create(config_n["lgas"])

