module StaticPages; end

if defined? Rails::Railtie
  require 'static_pages/railtie'
end
