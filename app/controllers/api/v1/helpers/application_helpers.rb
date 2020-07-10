module ApplicationHelpers
  def find_key_by_value(hash, value, namespaces = [])
    hash.each do |k, v|
      if v.is_a?(Hash)
        result = find_key_by_value(v, value, namespaces.push(k.to_s))
        return result if result.present?
      else
        if v == value || v.is_a?(Array) && v.include?(value)
          namespaces << k.to_s
          return namespaces
        end
      end
    end

    []
  end
end
