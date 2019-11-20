module SearchService
  def self.search(search_param)
    query = search_param.downcase
      trails = Trail.all
      filtered_trails = trails.select do |trail|
        if trail.title.downcase.include?(query) ||
          trail.description.downcase.include?(query) ||
          trail.city.downcase.include?(query) ||
          trail.country.downcase.include?(query) ||
          trail.continent.downcase.include?(query) 
          trail
        end
      end
  end
end