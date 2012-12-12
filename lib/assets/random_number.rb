module Sass::Script::Functions
  def random(limit)
    assert_type limit, :Fixnum
    rand(0..limit)
  end
  declare :random, args: [:limit]
end
