$PBExportHeader$n_svc_quicksort.sru
forward
global type n_svc_quicksort from nonvisualobject
end type
end forward

global type n_svc_quicksort from nonvisualobject autoinstantiate
end type

forward prototypes
public subroutine of_swap (ref long al_num[], long i, long j)
public subroutine of_quicksort (ref long arr[], long low, long high)
public function long of_partition (ref long arr[], long low, long high)
end prototypes

public subroutine of_swap (ref long al_num[], long i, long j);long temp 
temp = al_num[i];
al_num[i] = al_num[j];
al_num[j] = temp;
end subroutine

public subroutine of_quicksort (ref long arr[], long low, long high);long pi

if (low < high) then

	// pi is partitioning index, arr[p]
	// is now at right place
	pi = of_partition(arr, low, high);

	// Separately sort elements before
	// partition and after partition
	of_quickSort(arr, low, pi - 1);
	of_quickSort(arr, pi + 1, high);
	
end if
end subroutine

public function long of_partition (ref long arr[], long low, long high);// pivot
long pivot 

pivot = arr[high];

// Index of smaller element and
// indicates the right position
// of pivot found so far

long i 
i = (low - 1);
long j

for j = low to high
	
	// If current element is smaller 
	// than the pivot
	
	if (arr[j] < pivot) then
	
		// Increment index of 
		// smaller element
		i++;
		of_swap(arr, i, j);
	end if
next
	
of_swap(arr, i + 1, high);
return (i + 1);
end function

on n_svc_quicksort.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_svc_quicksort.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

