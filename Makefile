serve:
	docker compose run --rm -p 4000:4000 jekyll bundle exec jekyll serve --watch --host 0.0.0.0

serveIncremental:
	docker compose run --rm -p 4000:4000 jekyll bundle exec jekyll serve --watch --host 0.0.0.0 --incremental

install:
	docker compose run --rm -p 4000:4000 jekyll bundle install