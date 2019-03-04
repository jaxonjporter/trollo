class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  def self.all_boards(id)
    Board.find_by_sql(["
      SELECT * 
      FROM boards AS b
      WHERE b.user_id = ?
      ORDER BY created_at DESC
    ", id])
  end

  def self.one_board(u_id, b_id)
    Board.find_by_sql(["
    SELECT *
    FROM boards AS b
    WHERE b.id = ?
    ", b_id]).first
  end

  def self.create_board(p, id)
    Board.find_by_sql(["
      INSERT INTO boards (name, user_id, created_at, updated_at)
      VALUES (:name, :user_id, :created_at, :updated_at);
    ", {
      name: p[:name],
      user_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_board(p, id)
    Board.find_by_sql(["
      UPDATE boards AS b
      SET name = ?, updated_at = ?
      WHERE b.id = ?
    ", p[:name], DateTime.now, id])
  end

  def self.delete_board(id)
    Board.find_by_sql(["
      DELETE FROM boards AS b
      WHERE b.id = ?
    ", id])
  end
end
