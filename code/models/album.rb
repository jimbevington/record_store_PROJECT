require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id
  attr_accessor :title, :artist_id, :quantity, :genre, :buy_price, :sell_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @genre = options['genre']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, artist_id, genre, quantity, buy_price, sell_price)
           VALUES ($1, $2, $3, $4, $5, $6) RETURNING *"
    values = [@title, @artist_id, @genre, @quantity, @buy_price, @sell_price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, artist_id, genre, quantity, buy_price, sell_price) =
           ($1, $2, $3, $4, $5, $6) WHERE id = $%7"
    values = [@title, @artist_id, @genre, @quantity, @buy_price, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stock_level()
    if @quantity > 20
      return 'high'
    elsif @quantity > 10
      return 'medium'
    else
      return 'low'
    end
  end


  # SELF methods
  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)[0]
    return Album.new(album)
  end

end
