require 'the_role'
require 'rails'

module TheRole
  class Engine < Rails::Engine
    initializer "TheRole precompile hook", :group => :all do |app|
      app.config.assets.precompile += %w( admin_the_role.js admin_the_role.css )
    end

    config.to_prepare do
      Role.send :include, TheRole::RoleModel if the_class_exists? :Role
      Staff.send :include, TheRole::UserModel if the_class_exists? :Staff
      ApplicationController.send :include, TheRole::Requires if the_class_exists? :ApplicationController
    end
  end
end
