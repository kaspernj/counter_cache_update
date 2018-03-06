Rails.application.routes.draw do
  mount CounterCacheUpdate::Engine => "/counter_cache_update"
end
