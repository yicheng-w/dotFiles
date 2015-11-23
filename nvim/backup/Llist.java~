import java.util.*;
import java.io.*;

public class Llist<E> implements Iterable<E>{

    private Node<E> lead;
    private int len = 0;

    public Llist() {
        lead = new Node<E>();
    }

    public Iterator<E> iterator() {
        Llit<E> i = new Llit<E>(lead.getNext());
        return i;
    }

    public int length() {
        return len;
    }

    public void add(E s) {
        Node<E> tmp = new Node<E>(s);
        tmp.setNext(lead.getNext());
        lead.setNext(tmp);
        len++;
    }

    public void add(int n, E s) {
        Node<E> newEl = new Node<E>(s);
        Node<E> currentNode = lead.getNext();

        if (n > len) {
            throw new IndexOutOfBoundsException();
        }

        for (int i = 0 ; i < n - 1 ; i++) {
            currentNode = currentNode.getNext();
        }

        newEl.setNext(currentNode.getNext());
        currentNode.setNext(newEl);

        len++;
    }

    public String toString() {
        String s = "";
        Node<E> tmp;
        for (tmp = lead.getNext() ; tmp != null ; tmp = tmp.getNext()) {
            s = s + tmp + " --> ";
        }

        s = s + "null";
        return s;
    }

    public E get(int n) {
        if (n >= len || n < 0) {
            throw new IndexOutOfBoundsException();
        }

        Node<E> tmp = lead.getNext();

        for (int i = 0 ; i < n ; i++) {
            tmp = tmp.getNext();
        }

        return tmp.getData();
    }

    public E remove(int n) {
        if (n >= len || n < 0) {
            throw new IndexOutOfBoundsException();
        }

        Node<E> currentNode = lead;

        for (int i = 0 ; i < n - 1 ; i++) {
            currentNode = currentNode.getNext();
        }

        E removed = currentNode.getNext().getData();
        currentNode.setNext(currentNode.getNext().getNext());

        return removed;
    }

    public boolean remove(E s) {
        Node<E> tmp = lead;

        while (tmp != null) {
            if (tmp.getNext().getData().equals(s)) {
                tmp.setNext(tmp.getNext().getNext());
                return true;
            }

            tmp = tmp.getNext();
        }

        return false;
    }
}
