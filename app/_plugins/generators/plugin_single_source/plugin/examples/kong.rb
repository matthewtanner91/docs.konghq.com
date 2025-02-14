# frozen_string_literal: true

module PluginSingleSource
  module Plugin
    module Examples
      class Kong < Base
        EXAMPLES_PATH = 'app/_src/.repos/kong-plugins/examples'

        def file_path
          @file_path ||= File.join(EXAMPLES_PATH, plugin_folder, "_#{release_version}.yaml")
        end

        def release_version
          @version.split('.').first(2).join('.').concat('.x')
        end

        private

        def plugin_folder
          if @name == 'serverless-functions'
            'pre-function'
          else
            @name
          end
        end
      end
    end
  end
end
