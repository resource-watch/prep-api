# frozen_string_literal: true
JSONAPI.configure do |config|
  config.default_paginator = :paged
  config.resource_cache = Rails.cache

  config.default_page_size = 20

  # Metadata
  # Output record count in top level meta for find operation
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count
  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count

  # Relationship reflection invokes the related resource when updates
  # are made to a has_many relationship. By default relationship_reflection
  # is turned off because it imposes a small performance penalty.
  config.use_relationship_reflection = false
end
