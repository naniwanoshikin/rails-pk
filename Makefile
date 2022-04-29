# コンテナのポート確認
ps:
	docker-compose ps
# ログ
log:
	docker-compose logs
# 起動
build:
	docker-compose up --build -d
up:
	docker-compose up -d
# 停止
stop:
	docker-compose stop
# 削除
down:
	docker-compose down
# 全削除
pr:
	docker system prune

# シェル
bash:
	docker-compose run --rm web bash
# コンソール ⇄ cntrl + d
c:
	docker-compose exec web rails c
cs:
	docker-compose exec web rails c --sandbox
# ルーティング
route:
	docker-compose exec web rails routes
routeu:
	docker-compose exec web rails routes | grep users
routep:
	docker-compose exec web rails routes | grep posts
# Rubocop
rbo:
	docker-compose exec web bundle exec rubocop --require rubocop-airbnb
# Rspec
r:
	docker-compose exec web bundle exec rspec
rr:
	docker-compose exec web bundle exec rspec spec/requests
rs:
	docker-compose exec web bundle exec rspec spec/system
rm:
	docker-compose exec web bundle exec rspec spec/models
rh:
	docker-compose exec web bundle exec rspec spec/helpers

# migrate
m:
	docker-compose exec web rails db:migrate
mr:
	docker-compose exec web rails db:migrate:reset
seed:
	docker-compose exec web rails db:seed
md:
	docker-compose exec web rails db:migrate:down VERSION=20220309035728
st:
	docker-compose exec web rails db:migrate:status

# デプロイ
de:
	git add .
	git commit -m "about_css"
	git push origin map


# slim に変換 src/は消す erbは削除(バックアップ不可)
slim:
	docker-compose exec web bundle exec erb2slim app/views/home_pages/aa.html.erb app/views/home_pages/aa.html.slim -d
# 特定の相対パス, 特定の拡張子のファイルを削除
filed:
	find src/app/views -type f -name "*.slim" -delete
# 直前のコミットに戻る 特定のファイル
co:
	git checkout src/app/javascript/stylesheets
