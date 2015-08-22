#language: el
Λειτουργία: εγγραφής καινούργιου χρήστη
  
  Για μπορώ να χρησιμοποιώ την εφαρμογή με προσωπικό λογαριασμό, ως φίλος της εφαρμογής, προτείνω τη Λειτουργία Χρηστών και κατ' επέκταση την λειτουργία Εγγραφής Καινούργιου Χρήστη.
  
  Υπόβαθρο:
    Δεδομένου ότι επισκέπτομαι την εφαρμογή ως Eπισκέπτης
    * ζητώ να εγγραφώ
    * εμφανίζεται η φόρμα εγγραφής
    Και συμπληρώνω τη φόρμα εγγραφής
    
    Περιγραφή Σεναρίου: επιτυχυμένης εγγραφής
    Όταν δίνω έγκυρο <ψευδώνυμο>    
    * έγκυρη <η-διεύθυνση>
    * καταχωρώ 2 φορές έγκυρο <κωδικό>
    Και αιτούμαι να εγγραφώ
    Τότε να εγγράφομαι από την εφαρμογή 
    * να εμφανίζεται μήνυμα ότι Η εγγραφή έγινε με επιτυχία
    Και να μου αποστέλλεται η-ταχυδρομείο για επαλήθευση της <η-διεύθυνση>
    
    Παραδείγματα:
    | ψευδώνυμο | η-διεύθυνση         | κωδικός   |
    | ted       | ted@sociopub.com    | john1234  |
    | alan      | alan@sociopub.com   | 1234alan  |
    | ada       | ada@sociopub.com    | helloada! |
    | randy     | randy@socio.pub.com | randy123  |
    
    
    Περιγραφή Σεναρίου: απόπειρας εγγραφής με μη έγκυρη η-διεύθυνση 
    Όταν η <η-διεύθυνση> δεν είναι έγκυρη
    Και αιτούμαι να εγγραφώ
    Τότε να εμφανίζεται μήνυμα ότι Το πεδίο Η-Διεύθυνση είναι άκυρο

    Παραδείγματα:
    | η-διεύθυνση         |
    | ada@sociopub,com    |
    | sociopub.com        |
    | ted@sociopub.       |
    | alan@socio pub.com   |
    | randy@socio+pub.com |
    
  Σενάριο: απόπειρας εγγραφής με πολύ μεγάλο ψευδώνυμο    
    Όταν το όνομα χρήστη είναι πάνω από 20 χαρακτήρες
    Και αιτούμαι να εγγραφώ
    Τότε να εμφανίζεται μήνυμα ότι Το πεδίο Ψευδώνυμο είναι πολύ μεγάλο
    
  # Όταν εγγράφομαι στη εφαρμογή το ψευδώνυμο που θα πάρω θα πρέπει να είναι μοναδικό
  Σενάριο: απόπειρας εγγραφής με δεσμευμένο ψευδώνυμο
    Όταν  το ψευδώνυμο είναι δεσμευμένο
    Και αιτούμαι να εγγραφώ
    Τότε να εμφανίζεται μήνυμα ότι Το πεδίο Ψευδώνυμο το έχουν ήδη χρησιμοποιήσει

  Σενάριο: απόπειρας εγγραφής με η-διεύθυνση που είναι δεσμευμένη
    Όταν η η-διεύθυνση είναι δεσμευμένη
    Και αιτούμαι να εγγραφώ
    Τότε να εμφανίζεται μήνυμα ότι Το πεδίο Η-Διεύθυνση το έχουν ήδη χρησιμοποιήσει
  
  # Για λόγους αφαλείας ο κωδικός θα πρέπει να είναι πάνω από 5 χαρακτήρες
  Σενάριο: απόπειρας εγγραφής με μικρό κωδικό
    Όταν ο κωδικός είναι κάτω από 6 χαρακτήρες
    Και αιτούμαι να εγγραφώ
    Τότε να εμφανίζεται μήνυμα ότι το ελάχιστο μήκος είναι 6 χαρακτήρες

    # Για λόγους απλότητας το ψευδώνυμο στην εφαρμογή να είναι μόνο με αλφαριθμητικούς χαρακτήρες
  Σενάριο: απόπειρας εγγραφής με ψευδώνυμο που περιέχει μη-αλφαριθμητικούς χαρακτήρες
    Όταν το ψευδώνυμο περιέχει μη-αλφαριθμητικούς χαρακτήρες
    Και αιτούμαι να εγγραφώ
    Τότε να εμφανίζεται μήνυμα ότι Το πεδίο Ψευδώνυμο είναι άκυρο

