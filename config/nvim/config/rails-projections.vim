if !exists('g:rails_projections')
  let g:rails_projections = {}
endif

call extend(g:rails_projections, {
      \  "app/presenters/*.rb": {
      \     "command": "presenter",
      \     "test": "spec/presenter/{}_spec.rb",
      \     "alternate": "spec/presenter/{}_spec.rb",
      \     "template": "class {camelcase|capitalize|colons}\nend" }
      \ }, 'keep')

if !exists('g:rails_gem_projections')
  let g:rails_gem_projections = {}
endif

call extend(g:rails_gem_projections, {
      \ "active_model_serializers": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "template": "class {camelcase|capitalize|colons}Serializer < ActiveModel::Serializer\nend",
      \     "affinity": "model"}},
      \ "rspec": {
      \    "spec/support/*.rb": {
      \      "command": "support"}},
      \ "cucumber": {
      \   "features/*.feature": {
      \     "command": "feature",
      \     "template": "Feature: {capitalize|blank}"},
      \   "features/support/*.rb": {
      \     "command": "support"},
      \   "features/support/env.rb": {
      \     "command": "support"},
      \   "features/step_definitions/*_steps.rb": {
      \     "command": "steps"}},
      \ "carrierwave": {
      \   "app/uploaders/*_uploader.rb": {
      \     "command": "uploader",
      \     "template": "class {camelcase|capitalize|colons}Uploader < CarrierWave::Uploader::Base\nend"}},
      \ "draper": {
      \   "app/decorators/*_decorator.rb": {
      \     "command": "decorator",
      \     "affinity": "model",
      \     "template": "class {camelcase|capitalize|colons}Decorator < ApplicationDecorator\nend"}},
      \ "fabrication": {
      \   "spec/fabricators/*_fabricator.rb": {
      \     "command": ["fabricator", "factory"],
      \     "alternate": "app/models/{}.rb",
      \     "related": "db/schema.rb#{pluralize}",
      \     "test": "spec/models/{}_spec.rb",
      \     "template": "Fabricator :{} do\nend",
      \     "affinity": "model"}},
      \ "factory_girl": {
      \   "spec/factories/*.rb": {
      \     "command": "factory",
      \     "alternate": "app/models/{}.rb",
      \     "related": "db/schema.rb#{pluralize}",
      \     "test": "spec/unit/{}_spec.rb",
      \     "template": "FactoryGirl.define do\n  factory :{} do\n  end\nend",
      \     "affinity": "model"},
      \   "spec/factories.rb": {
      \      "command": "factory"},
      \   "test/factories.rb": {
      \      "command": "factory"}}
      \ }, 'keep')

" Generic non-Rails projections with projectile.vim
if !exists('g:projectionist_heuristics')
  let g:projectionist_heuristics = {}
endif

call extend(g:projectionist_heuristics, {
      \ "config.rb&source/": {
      \   "source/stylesheets/*.sass": { "command" : "stylesheet" },
      \   "source/stylesheets/*.scss": { "command" : "stylesheet" },
      \   "source/stylesheets/*.css":  { "command" : "stylesheet" },
      \   "source/javascripts/*.js":   { "command" : "javascript" },
      \   "source/javascripts/*.coffee": { "command" : "javascript" },
      \   "source/*.html": { "command" : "view" },
      \   "source/*.haml": { "command" : "view" },
      \   "config.rb": { "command" : "config" }
      \ }
      \ }, 'keep')
