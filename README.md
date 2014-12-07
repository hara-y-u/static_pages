[WIP] static_pages
==================

Provides supports for static pages (like error pages) to rails.

## Install

```
gem 'static_pages'
```

## Usage

Put template files in `app/assets/static_pages`

```
# error pages
app/assets/static_pages/
           ├── 404.html.slim
           ├── 422.html.slim
           └── 500.html.slim
```

Now, `$ rake assets:precompile` will generate htmls in `public` directory.
To generate htmls only, use `$ rake static_pages:precompile`

## TODO

* Move `static_pages` directory below `app` cause its treated as static assets when its in `app/assets` directory.
* Override helpers like `stylesheets_include_tag ..etc` to extract CSS/JS inline on production.
* Availability to use layout for template.
* Mount static pages path to routes.
* Error Pages generator.
