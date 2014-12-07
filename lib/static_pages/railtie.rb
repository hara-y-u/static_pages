module StaticPages
  class Railtie < ::Rails::Railtie
    # LOOSE_APP_ASSETS = lambda do |filename, path|
    #   path =~ /app\/assets/ && !%w(.js .css).include?(File.extname(filename))
    # end

    config.static_pages = ActiveSupport::OrderedOptions.new
    config.static_pages.precompile = %w(*.html)
    config.static_pages.prefix = ''
    config.static_pages.manifest = 'static_pages-manifest.json'

    rake_tasks do |app|
      require 'static_pages/task'
      Task.new(app)
      Rake::Task['assets:precompile'].enhance do
        Rake::Task['static_pages:precompile'].invoke
      end
    end
  end
end
