package com.levs2001.main;

public class Main {
    public static String HELLO_WORLD = "Hello world!";

    public static String getHello() {
        return "Hello world!";
    }

    public static void main(String[] args) {
        System.out.println(getHello() + " And hello " + System.getenv("NAME"));
        System.out.println("Your number from env was " + System.getenv("NUMBER"));
    }
}
