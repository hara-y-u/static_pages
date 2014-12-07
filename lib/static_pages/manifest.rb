require 'sprockets'

module StaticPages
  class Manifest < Sprockets::Manifest
    def compile(*args)
      unless environment
        fail Error, 'manifest requires environment for compilation'
      end

      paths = environment.each_logical_path(*args).to_a +
        args.flatten.select { |fn| Pathname.new(fn).absolute? if fn.is_a?(String) }

      paths.each do |path|
        if asset = find_asset(path)
          last_mtime = if file = files[asset.logical_path]
                         Time.parse(file['mtime'])
                       end
          files[asset.logical_path] = {
            'logical_path' => asset.logical_path,
            'mtime'        => asset.mtime.iso8601,
            'size'         => asset.bytesize,
            'digest'       => ''
          }
          assets[asset.logical_path] = asset.logical_path

          target = File.join(dir, asset.logical_path)

          if File.exist?(target) && last_mtime && asset.mtime <= last_mtime
            logger.debug "Skipping #{target}, already exists and not modified"
          else
            logger.info "Writing #{target}"
            asset.write_to target
            asset.write_to "#{target}.gz" if asset.is_a?(Sprockets::BundledAsset)
          end
        end
      end
      save
      paths
    end
  end
end
