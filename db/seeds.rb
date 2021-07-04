# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
income, cost, savings = Category.create([{name: "収入"}, {name: "支出"}, {name: "貯蓄"}])

main_income, sub_income = income.children.create([{name: "メイン収入"}, {name: "サブ支出"}])
main_income.children.create([{name: "給与"}, {name: "ボーナス"}])
sub_income.children.create([{name: "副業"}, {name: "配当"}, {name: "不動産収入"}, {name: "臨時・その他収入"}])

fixed_cost, variable_cost = cost.children.create([{name: "固定費"}, {name: "変動費"}])
fixed_cost.children.create([{name: "住宅"}, {name: "保険"}, {name: "水道・光熱費"}, {name: "通信費"}, {name: "教養・教育（固定）"}, {name: "ローン（住宅ローン除く）"}, {name: "税・社会保障"}, {name: "その他固定費"}])
variable_cost.children.create([{name: "食費"}, {name: "日用品"}, {name: "衣服・美容"}, {name: "交際費"}, {name: "交通費"}, {name: "健康・医療"}, {name: "教養・教育"}, {name: "趣味・娯楽"}, {name: "特別費"}, {name: "雑費(その他）"}])

deposit, saving_money, investment = savings.children.create([{name: "預金"}, {name: "貯金"}, {name: "投資"}])
deposit.children.create([{name: "普通預金"}, {name: "定期預金"}, {name: "積立預金"}])
saving_money.children.create([{name: "My貯金"}, {name: "タンス貯金（緊急用）"}, {name: "その他貯金"}])
investment.children.create([{name: "NISA・積立NISA"}, {name: "iDeCo"}, {name: "投資信託"}, {name: "株式投資"}, {name: "国債・社債"}, {name: "不動産投資"}, {name: "その他投資"}])