#Creates the AccountArray and populates it with locked out objects
$AccountArray = @(search-adaccount -lockedout)
#Initialises index at 0
$Index = 0

#For the aesthetic 
clear-host

#Loops through array
foreach ($account in $AccountArray) {

    #Prints Index and relative hostname on screen
    write-host $Index - $Account.Name
    #Increments Index
    $Index ++
}

#Input for the index reference value used to determine which account to unlock
$IndexRef = Read-host -Prompt "Select Account No. to unlock"
#Unlocks the specified AD account from Index Ref value
Unlock-ADAccount -identity $AccountArray[($IndexRef)]


