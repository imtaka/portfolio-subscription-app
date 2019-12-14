# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { tagname: '音楽'},
  { tagname: '動画'},
  { tagname: '漫画'},
  { tagname: '雑誌'},
  { tagname: '洋服'},
  { tagname: '恋愛'},
  { tagname: '美容室'}
])