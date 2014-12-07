require 'static_pages/manifest'
require 'sprockets/rails'

module StaticPages
  class Task < Sprockets::Rails::Task
    def assets
      app.config.static_pages.precompile
    end

    def output
      File.join(app.root, 'public', app.config.static_pages.prefix)
    end

    def manifest_path
      File.join(output, app.config.static_pages.manifest)
    end

    def manifest
      StaticPages::Manifest.new(index, nil, manifest_path)
    end

    def define
      namespace :static_pages do
        desc 'Compile all the static pages named in config.assets.static_pages.precompile'
        task precompile: :environment do
          with_logger do
            manifest.compile(assets)
          end
        end
      end
    end
  end
end
