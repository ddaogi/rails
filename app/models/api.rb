require "httparty"
class Api
  def initialize(object, **update_field)

    @object = object
    @headers = {
      headers: {
        "Content-Type" => "application/json"
      }
    }
    @update_field = update_field
  end

  private


  def request_body
    {
      "username": @object.name
    }
  end
end
