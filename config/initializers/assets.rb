# Be sure to restart your server when you modify this file.

# Version of your initializers, change this if you want to expire all your initializers.
Rails.application.config.assets.version = '1.0'

# Add additional initializers to the asset load path
# Rails.application.config.initializers.paths << Emoji.images_path

# Precompile additional initializers.
# application.js, application.css.sass, and all non-JS/CSS in app/initializers folder are already added.
# Rails.application.config.initializers.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( ckeditor/* )