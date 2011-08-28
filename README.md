# Accounts

In studying for the AAT, instead of doing what most people would do and work
through the worked examples, I'm going to put together an accounting system
which demonstrates the principles that I'm learning. There's no better way to
learn stuff than implement it in code, right? I put together an initial app
that allowed me to demonstrate the T Tables, and visualise particular
worksheets. That was nice, but now I need a more intricate base to work from.

There are several inputs into an accounting system. There are the
accrual-based things (where the asset/liability is noted before any cash
changes hands):

* Sales invoices, which are the things I, as a business, create to record the
  fact that I have sold something to you, on credit, and I expect you to pay
  me at some point in the future.

* Credit notes, which is something I, as a business, create to record the fact
  that I previously sold you something and you're returning it. I will pay you
  back the money stated on the credit note at some point in the future (or
  write off a portion of an invoice against it, but that's an avoidable
  complication for now).

* Purchase invoices, which are things I, as a business, receive when I buy
  something on credit. I expect to pay the balance of a purchase invoice to
  you at some point in the future.

* Purchase credit notes (for the sake of argument) which are things I, as a
  business, receive when I return an item I have already been invoiced/paid
  for. I expect you to pay me the balance of the purchase credit note at some
  point in the future.

These are all recorded in their associated books of prime entry:

* Sales invoices are recorded in the Sales Day Book.

* Sales credit notes are recorded in the Sales Returns Day Book.

* Purchase invoices are recorded in the Purchases Day Book.

* Purchase credit notes are Purchases Returns Day Book.

Then there's cash (which could be real cash, or, more likely transactions on a
bank account). There are a all the cash transactions that match up with the
cash changing hands for an accrual-based thingumie:

* Sales invoice payment received.

* Sales credit note payment made.

* Purchase invoice payment made.

* Purchase credit note payment received.

Then there's the direct cash transactions:

* Cash sale, where I get cash for having sold something without raising an
  invoice.

* Cash sale refund, where I refund somebody  without raising a credit note.

* Cash purchase, where I buy stuff for cash without getting a purchase invoice
  first.

* Cash purchase refund, where I get a refund for something I've bought,
  without the other party having raised a credit note.

These are all recorded in the Cash Book, the other book of prime entry.

In terms of modelling these things, each accrual thingumie (Sales/Purchase
Invoice/Credit Note) has several common features:

* Some sort of identifier, so we can trace them through the accounts.
* They belong to a single contact (supplier or client).
* They have a date, which is the tax point.
* They have payment terms, expressed in days.
* There can be a trade discount, expressed as a percentage.
* There can be a settlement discount, expressed as a percentage. The
  settlement discount is allowed if the payment is received within the payment
  terms.

Each of them also has many line items, which contain:

* A category, which can later be used to analyse purchases or sales.
* A quantity.
* A VAT rate, expressed as a percentage.
* A unit price.

So this gives us another two models we're going to need in order to round out
the system:

* A contact, which we'll just give a name and a code to, for now.
* A category, which we'll also just give a name and a code to.

That's about it. Once we've got the books of prime entry (sales, sales
returns, purchases, purchases returns and cash books), we take the daily
totals and memoranda from each and produce:

* Main ledger
* Subsidiary Sales Ledger
* Subsidiary Purchases Ledger

That's the goal of this app.
