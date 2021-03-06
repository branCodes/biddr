#to get a D:
```
TDD for CRUD to create the auction. 

TDD for creating a bid on an auction. 

Validate that bid price must by higher than the current price. Set current price to highest bid.
```



#to get a C:
```
Add state machine with these states for the auction.: published / reserve met / won / canceled / reserve not met. Just enforce triggering going from published to reserve met for now.

Make current price go $1 above highest bid instead of making it the same as the highest bid
```


#to get a B:
```
Add user authentication and disallow the person to bid on own auctions. *create from scratch for bonus*

Display user's name beside their bid.

Make a page to list all the bids that someone has made on all the auctions.
```


#to get an A:
```
Make bidding happen with AJAX. Make adding the bid to the listing fade in.
```


#to get an A+:
```
Add capybara tests for creating an auction and bidding (at least 2 each).
```

#to get an A++:
```
Integrate with Stripe: Ask for card info the first time before being allowed to bid and store their token to charge them when auction end.
```
