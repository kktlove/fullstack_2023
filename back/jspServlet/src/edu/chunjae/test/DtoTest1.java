package edu.chunjae.test;

import edu.chunjae.dto.Notice;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class DtoTest1 {
    List<Notice> notiList = new ArrayList<>();
    Notice noti = new Notice();

    @Test
    public void addNotice(){
        System.out.println("addNotice 테스트");
        noti.setNo(1);
        noti.setTitle("JUint4 테스트");
        noti.setContent("JUnit4 테스트 글입니다.");
        noti.setResdate("2023-08-18");
        noti.setVisited(1);
        notiList.add(noti);
    }

    @Test
    public void getNotice(){
        System.out.println("getNotice가 진행됩니다.");
        Notice n = notiList.get(0);
        System.out.println(noti.toString());
    }
}
