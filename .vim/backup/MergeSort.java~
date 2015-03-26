import java.util.*;
import java.io.*;

public class MergeSort {
	
	public static ArrayList<Integer> mergeSort(ArrayList<Integer> data) {
		if (data.size() == 1) {
			return data;
		}

		else {
			ArrayList<Integer> A = new ArrayList<Integer>();
			ArrayList<Integer> B = new ArrayList<Integer>();

			for (int i = 0 ; i < data.size() / 2 ; i++) {
				A.add(data.get(i));
			}
			for (int i = data.size() / 2 ; i < data.size() ; i++) {
				B.add(data.get(i));
			}

			ArrayList<Integer> AS = mergeSort(A);
			ArrayList<Integer> BS = mergeSort(B);
			return merge(AS, BS);
		}
	}

	public static ArrayList<Integer> merge(ArrayList<Integer> A, ArrayList<Integer> B) {
		ArrayList<Integer> result = new ArrayList<Integer>();

		while(A.size() != 0 && B.size() != 0) {
			if (A.get(0) > B.get(0)) {
				result.add(B.remove(0));
			}
			else {
				result.add(A.remove(0));
			}
		}

		result.addAll(A);
		result.addAll(B);
		
		return result;
	}

	public static int[] mergeSort(int[] data) {
        if (data.length == 1) {
            return data;
        }

        else {
            int[] A = Arrays.copyOfRange(data, 0, data.length / 2);
            int[] B = Arrays.copyOfRange(data, data.length / 2, data.length);

            int[] AS = mergeSort(A);
            int[] BS = mergeSort(B);
            //System.out.println(Arrays.toString(AS));
            //System.out.println(Arrays.toString(BS));
            //System.out.println("\t" + Arrays.toString(merge(AS, BS)));
            return merge(AS, BS);
        }
    }

    public static int[] merge(int[] A, int[] B) {
        int[] result = new int[A.length + B.length];
        int position = 0;
        int APos = 0;
        int BPos = 0;
        while (APos < A.length && BPos < B.length) {
            if (A[APos] < B[BPos]) {
                result[position] = A[APos];
                APos++;
            }
            else {
                result[position] = B[BPos];
                BPos++;
            }
            position++;
        }

        for (int i = APos ; i < A.length ; i++) {
            result[position] = A[i];
            position++;
        }
        for (int i = BPos ; i < B.length ; i++) {
            result[position] = B[i];
            position++;
        }
        return result;
    }
}
