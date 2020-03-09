
lady = Category.create(:category_name=>"レディース")

lady_tops = lady.children.create(:category_name=>"トップス")
lady_jacket = lady.children.create(:category_name=>"ジャケット/アウター")

lady_tops.children.create([{:category_name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:category_name=>"Tシャツ/カットソー(七分/長袖)"},{:category_name=>"その他"}])
lady_jacket.children.create([{:category_name=>"テーラードジャケット"}, {:category_name=>"ノーカラージャケット"}, {:category_name=>"Gジャン/デニムジャケット"},{:category_name=>"その他"}])
