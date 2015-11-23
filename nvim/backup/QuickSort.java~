import java.util.Arrays;

public class QuickSort {

    public static int partition(int[] a, int l, int r) {
	    int tmp;
		//int pivotIndex = l+rnd.nextInt(r-l);
		int pivotIndex=l;
		int pivot = a[pivotIndex];
		tmp = a[r];
		a[r] = a[pivotIndex];
		a[pivotIndex]=tmp;
				
		int wall=l;
		int pcount=1;
		for (int i=l;i<r;i++) {
			if (a[i]<pivot) {
				tmp = a[i];
	    		a[i]=a[wall];
				a[wall]=tmp;
				wall++;
			}
    		if (a[i]==pivot)
				pcount++;
	    }
		// now copy over all the pivots
		int rwall=wall;
		tmp = a[rwall];
		a[wall]=a[r];
		a[r]=tmp;
		rwall++;
		for (int i=rwall+1;i<=r;i++) {
			if (a[i]==pivot) {
				tmp = a[rwall];
				a[rwall]=a[i];
				a[i]=tmp;
				rwall++;
			}
		}

		return (wall+rwall)/2;
    }

    public static int[] sort(int[] A, int l, int r) {
        if (l < r) {
            int pivotIndex = partition(A, l, r);
            sort(A, l, pivotIndex - 1);
            sort(A, pivotIndex + 1, r);
        }

        return A;
    }


    public static void main(String[] args) {
        int[] test = new int[]{4, 5, 1, 2, 3, 7, 6, 9, 8, 0};

        int[] sorted = QuickSort.sort(test, 0, test.length - 1);

        System.out.println(Arrays.toString(sorted));
    }

}
