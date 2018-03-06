# frozen_string_literal: true

Rails.application.routes.draw do
  mount CounterCacheUpdate::Engine => "/counter_cache_update"
end
