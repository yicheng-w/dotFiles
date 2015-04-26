public class BST<T extends Comparable<T>> {
    private Node<T> root;
    
    public BST(T data) {
        root = new Node<T>(data);
    }

    public Node<T> search(T i) {
        Node<T> tmp = root;
        while (tmp != null) {
            int c = tmp.getData().compareTo(i);
            if (c == 0) {
                return tmp;
            }

            tmp = (c > 0) ? tmp.getRight() : tmp.getLeft();
        }
        return null;
    }

    private Node<T> searchRH(Node current, T i) {
        int c = current.getData().compareTo(i);
        if (c == 0) {
            return current;
        }

        if (c > 0) {
            return searchRH(current.getLeft(), i);
        }

        return searchRH(current.getRight(), i);
    }

    public Node<T> searchR(T i) {
        return searchRH(root, i);
    }

    public void insert(T i) {
        Node<T> tmp1 = root;
        Node<T> tmp2 = null;

        while (tmp1 != null) {
            int c = i.compareTo(tmp1.getData());
            tmp2 = tmp1;

            tmp1 = (c > 0) ? tmp1.getRight() : tmp1.getLeft();
        }

        int c = i.compareTo(tmp2.getData());
        Node<T> newNode = new Node<T>(i);
        if (c > 0) {
            tmp2.setRight(newNode);
        }
        else {
            tmp2.setLeft(newNode);
        }
    }

    private void insertRH(Node current, T i) {
        if (current.isLeaf()) {
            if (current.getData().compareTo(i) > 0) {
                current.setLeft(new Node<T>(i));
            }
            else {
                current.setRight(new Node<T>(i));
            }
            return;
        }

        if (current.getData().compareTo(i) > 0) {
            insertRH(current.getLeft(), i);
        }
        else {
            insertRH(current.getRight(), i);
        }
    }

    public void insertR(T i) {
        insertRH(root, i);
    }

    // We use the tree as specified in the following article:
    // http://stackoverflow.com/questions/13435323/string-representation-of-binary-search-tree
    // i.e. we use "<" and ">" to trace out how to get to a certain node.

    private String toStringSubTree(Node current, boolean left, String prefix) {
        if (current == null) {
            return "";
        }

        String newPrefix = prefix;
        if (left) {
            newPrefix = newPrefix + "<";
        }
        else {
            newPrefix = newPrefix + ">";
        }
        
        return newPrefix + current.getData() + "\n" + toStringSubTree(current.getLeft(), true, newPrefix) + toStringSubTree(current.getRight(), false, newPrefix);
    }

    public String toString() {
        return root.getData() + "\n" + toStringSubTree(root.getLeft(), true, "") + toStringSubTree(root.getRight(), false, "");
    }

    public static void main(String[] args) {
        BST<Integer> tmp = new BST<Integer>(10);
        tmp.insert(5);
        tmp.insert(20);
        tmp.insert(17);
        tmp.insert(8);
        tmp.insert(2);
        tmp.insert(25);
        System.out.println(tmp);

        System.out.println(tmp.searchR(8).getData().toString());

        tmp.insertR(100);

        System.out.println(tmp);
    }
}
