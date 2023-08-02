serve:
	docker compose run --rm -p 4000:4000 jekyll bundle exec jekyll serve --incremental --watch --host 0.0.0.0

install:
	docker compose run --rm -p 4000:4000 jekyll bundle install