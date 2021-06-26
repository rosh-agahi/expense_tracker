# Expense Tracker

Expense Tracker is an app that can be used to track a user's expenses. The user registers for an account using a unique username. Then they can log in and create Expense Categories. Lastly they add expenses and assign them to a category. The category index page lists out all of the user's expense categories and the sum of all the expenses within a category. It also shows a bar chart below that depicts the percent distribution of expenses across the various categories.

The user can create, create, update, and destroy all expenses. The user can also create, read and update any expense category - and if there are no expenses attributed to a category, they can delete the category.

## Installing

To install the app in your local environment:

1. Fork and clone the repository.
2. Load the repository in your favorite development software. I use Atom.
3. Run 'bundle install' in your terminal to install any uninstalled dependencies.
4. Run 'shotgun' in your terminal to create a local environment to run and play with the app.

## Resources

* Sinatra - provides the MVC framework
* ActiveRecord - database manager
* sqlite3 - database engine
* bcrypt - password hasher
* rack-flash3 - display error notices

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rosh-agahi/expense_tracker/

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## Authors
Roshanak Agahi - App Creator

## License
This project is licensed under the MIT License - see the LICENSE file for details
