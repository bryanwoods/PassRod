class Controller
  attr_writer :friendsTableView
    
  def awakeFromNib
    @friends = []
	@friendsTableView.dataSource = self
  end
  
  def numberOfRowsInTableView(view)
    @friends.size
  end
  
  def tableView(view, objectValueForTableColumn:column, row:index)
    friend = @friends[index]
    case column.identifier
      when 'first_name'
        friend.first_name
      when 'last_name'
        friend.last_name
	  when 'password_name'
	    friend.password_name
    end
  end
  
  def tableView(view, setObjectValue:object, forTableColumn:column, row:index)
    friend = @friends[index]
	case column.identifier
	  when 'first_name'
	    friend.first_name = object
	  when 'last_name'
	    friend.last_name = object
	  when 'password_name'
	    friend.password_name
	end
  end
  
  def generate(length = 10)
    password = ""
    possible = %w{0 1 2 3 4 5 6 7 8 9 0 a b c d e f g h i j k l M N O P Q R S T U V W X Y Z ! $ # @ & * . ' =}
    length.times {password << possible[rand(possible.size)]}
    password
  end
    
  def addFriend(sender)
    new_friend = Friend.new
    new_friend.first_name = "Web Service"
    new_friend.last_name = "Your Username"
	new_friend.password_name = generate
    @friends << new_friend
    @friendsTableView.reloadData
  end
  
  def removeFriend(sender)
	puts @friends[0].public_methods
	puts @friends[0]
  end
end