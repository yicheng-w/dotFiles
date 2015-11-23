import java.util.ArrayList;
import java.util.Arrays;

public class Selection {

    public static int select(int k, int[] data) {
        int lastPos = data.length - 1;
        int pivot = data[0];
        int pivotPos = 0;
        for (int pos = 1 ; pos < data.length ; pos++) {
            if (data[pos] < pivot) {
                int temp = data[pos];
                for (int i = pos ; i > pivotPos ; i--) {
                    data[i] = data[i - 1];
                }
                data[pivotPos] = temp;
                pivotPos = pivotPos + 1;
            }
        }

        if (k == pivotPos) {
            return pivot;
        }

        else if (k < pivotPos) {
            return select(k, Arrays.copyOfRange(data, 0, pivotPos));
        }

        else {
            return select(k - pivotPos - 1, Arrays.copyOfRange(data, pivotPos + 1, data.length));
        }
    }

    // Select with partition and altercation
    // Also, for this one k is the position, not index

    public static int select(int k, int[] A, int l, int h) {
        // Base case:
        if (l >= h) {
            return A[k - 1];
        }

        int[] newArr = new int[A.length];
        int pivotIndex = (l + h) / 2;
        int pivot = A[pivotIndex];
        int low = l, high = h;

        for (int i = l ; i <= h ; i++) {
            if (A[i] == pivot)
                continue;

            else if (A[i] > pivot) {
                newArr[high--] = A[i];
            }
            else {
                newArr[low++] = A[i];
            }
        }

        pivotIndex = low;

        while (low <= high) {
            newArr[low++] = pivot; // Now the empty spot should be the pivot
        }

        if (newArr[k - 1] == pivot) {
            return pivot;
        }

        else if (pivotIndex > k - 1) {
            return select(k, newArr, l, pivotIndex - 1);
        }

        else {
            return select(k, newArr, pivotIndex + 1, h);
        }
    }

    public static int select2(int k, int[] n) {
        int[] a = MergeSort.mergeSort(n);
        return a[k - 1];
    }

    public static void main(String[] args) {
        int[] test = new int[]{4, 5, 1, 2, 3, 7, 6, 9, 8, 0};

        for (int i = 1 ; i <= 10 ; i++)
            // System.out.println(select(i, test));
            System.out.println(select(i, test, 0, test.length - 1));
    }
}
