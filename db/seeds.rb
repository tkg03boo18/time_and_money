# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

{'収入' => %w(給与・ボーナス 副業 配当 不動産収入 臨時・その他収入), '支出（固定費）' => %w(住宅 水道・光熱費 通信費 教養・教育 ローン（住宅除く） 税・社会保障 その他固定費), '支出（変動費）' => %w(食費 日用品 衣服・美容 交際費 健康・医療 交通費 教育・教養 趣味・娯楽 特別費 雑費（その他変動費）), '貯蓄・投資' => %w(銀行預金 My貯金 タンス貯金（緊急用） NISA iDeCo 株式投資 その他貯蓄・投資)}.each do |main_category_name, sub_category_names|
  main_category = MainCategory.create(name: main_category_name)
  sub_category_names.each do |sub_category_name|
    main_category.sub_categories.create(name: sub_category_name)
  end
end