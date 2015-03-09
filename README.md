### Introduction 

This was the week 2 challenge at Makers Academy. The task was to create a takeaway ordering system using the Twilio API which would enable a customer to order food and be notified that the delivery is on its way via text.

### Process 

1. list of dishes with prices
2. placing the order by giving the list of dishes, their quantities and a number that should be the exact total. If 3. the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the  order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
4. The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
5. Use twilio-ruby gem to access the API
6. Use a Gemfile to manage your gems
7. Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
8. However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent

### Status

Project complete. 

### What I learnt 

I learnt a huge amount of APIs and how to stub them. I was also able to consolidate what I had learnt about OOD through the previous Battleships project. My 'takeaway' from this project is that it is important to think about how to model your domain objects and observe SRP. 

