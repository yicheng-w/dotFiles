public class myQueue<E> {
    private Node<E> top;
    private Node<E> bottom;

    public myQueue() {
        top = new Node<E>();
        bottom = new Node<E>();
        top.setNext(bottom);
        bottom.setPrevious(top);
    }

    public boolean empty() {
        return (top.getNext().equals(bottom));
    }

    public void enqueue(E data) {
        Node<E> tmp = new Node<E>(data);
        top.getNext().setPrevious(tmp);
	tmp.setPrevious(top);
        tmp.setNext(top.getNext());
        top.setNext(tmp);
    }

    public E dequeue() {
        if (empty()) {
            return null;
        }

        Node<E> tmp = bottom.getPrevious();
        bottom.setPrevious(bottom.getPrevious().getPrevious());
        bottom.getPrevious().setNext(bottom);
        return tmp.getData();
    }

    public E head() {
        if (empty()) {
            return null;
        }
        return bottom.getPrevious().getData();
    }

    public String toString() {
        String s = "TOP\n";
        for (Node<E> tmp = top.getNext() ; !(tmp.equals(bottom)); tmp = tmp.getNext())
            s += tmp.getData() + "\n";

        return s + "BOTTOM\n";
    }
}
