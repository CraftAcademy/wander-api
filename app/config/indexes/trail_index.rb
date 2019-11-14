class TrailIndex < Chewy::Index
  define_type Trail.all do
    field :title
  end
end