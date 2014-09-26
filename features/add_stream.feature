/*
Ο χρήστης Θα μπορεί να εγγραφεί σε ροή.
Η νέα ροή θα αρχικοποιείται στη βάση του συστήματος με keywords, tags
Όταν κάποιος χρήστης την αναζητήσει δεν θα χρειαστεί να γίνει η ίδια διαδικασία.
Μια ροή μπορεί να έιναι και συνδέσμοι που μοιράζει άλλος χρήστης.
Ένας χρήστης θα μπορεί να φτιάξει προσαρμοσμένη, δική του ροή που μπορεί να αποτελείται από διάφορες ροές ή από συνδέσμους ενός συνδιασμού 
από tags.
*/

Feature: Add Stream

   Scenario: Add An Existing Stream
    Given a user visits the profile page
    When they submit invalid link
    Then they should see an error message

  Scenario: Add An Invalid Non Existing Stream 
    Given a user visits the profile page
    When the user submits valid link
    Then they should see suggested tags
    And they should see a small description

   Scenario: Add A Valid Existing Stream
    Given a user visits the profile page
    When they submit invalid link
    Then they should see an error message
