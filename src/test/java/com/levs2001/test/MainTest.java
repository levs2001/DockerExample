package com.levs2001.test;

import com.levs2001.main.Main;
import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;

public class MainTest {
    @Test
    void helloTest() {
        assertThat("hello error", Main.getHello().equals(Main.HELLO_WORLD));
    }
}
