# frozen_string_literal: true
require "pagy/extras/metadata"

module Paginable
  extend ActiveSupport::Concern

  def render_with_pagy(collection:, serializer:, page: nil, items: nil, serializer_options: {}, other_info: {} )
    pagy, @collection = pagy(collection, items:, page:)
    meta = pagy_meta(pagy)

    render json: @collection,
           adapter: :json,
           each_serializer: serializer,
           meta:, meta_key: "pagination",
           **serializer_options


  end

  private

  def pagy_meta(pagy)
    {
      has_next: pagy.next.present?,
      next_page: pagy.next&.to_s
    }
  end

  def paginator_meta(paginator)
    {
      pagination: {
        has_next: paginator.has_next,
        next_page: paginator.next_page.to_s.presence
      }
    }
  end
end