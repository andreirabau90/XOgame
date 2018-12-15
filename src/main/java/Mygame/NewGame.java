//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package Mygame;

import java.util.HashMap;
import java.util.function.Predicate;
import java.util.stream.Stream;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NewGame {
    public NewGame() {
    }

    @RequestMapping({"start"})
    public String Start(@RequestParam("line") int line, @RequestParam("column") int column, HttpServletRequest request) {
        HashMap<Integer, String> myGameMap = new HashMap();
        HashMap<Integer, String> myHistory = new HashMap();

        for(int i = 1; i <= line * column; ++i) {
            myGameMap.put(i, "");
        }

        boolean resultGame = true;
        request.setAttribute("resultGame", resultGame);
        request.setAttribute("line", line);
        request.setAttribute("column", column);
        request.setAttribute("history", myHistory);
        request.setAttribute("result", myGameMap);
        return "PlayingFlied";
    }

    @RequestMapping({"game"})
    public String PlayingGame(@RequestParam("line") int lines, @RequestParam("column") int column, @RequestParam(value = "resultGame",defaultValue = "true") Boolean resultGame, @RequestParam(value = "historyKey",defaultValue = "0") Integer[] historyKey, @RequestParam(value = "historyValue",defaultValue = "0") Integer[] historyValue, @RequestParam("resultKey") Integer[] resultKey, @RequestParam("resultValue") String[] resultValue, @RequestParam(value = "name",defaultValue = "1",required = false) Integer buttonOnclick, HttpServletRequest request) {
        String winner = "";
        int id = lines * column;
        HashMap<Integer, String> myMap = new HashMap();
        HashMap<Integer, Integer> turnHistory = new HashMap();
        int i;
        if (historyValue[0] != 0) {
            for(i = 0; i < historyKey.length; ++i) {
                turnHistory.put(historyKey[i], historyValue[i]);
            }
        }

        for(i = 0; i < id; ++i) {
            myMap.put(resultKey[i], resultValue[i]);
            if (resultKey[i] == buttonOnclick && resultValue[i].equals("")) {
                if (turnHistory.size() % 2 == 0) {
                    myMap.put(resultKey[i], "X");
                } else if (turnHistory.size() % 2 == 1) {
                    myMap.put(resultKey[i], "0");
                }
            }
        }

        if (turnHistory.size() == 0) {
            turnHistory.put(0, buttonOnclick);
        } else if (turnHistory.values().stream().anyMatch((x) -> {
            return x == buttonOnclick;
        })) {
            winner = "Такой ход уже был";
        } else {
            turnHistory.put(turnHistory.size(), buttonOnclick);
        }

        if (turnHistory.size() > 4 && resultGame) {
            for(i = 1; i <= lines; ++i) {
                if (Stream.of((String)myMap.get(i + (i - 1) * 2), (String)myMap.get(i + 1 + (i - 1) * 2), (String)myMap.get(i + 2 + (i - 1) * 2)).distinct().count() == 1L && !((String)myMap.get(i + (i - 1) * 2)).equals("")) {
                    winner = " winner :" + (String)myMap.get(i + (i - 1) * 2);
                    resultGame = false;
                } else if (Stream.of((String)myMap.get(i), (String)myMap.get(i + 3), (String)myMap.get(i + 6)).distinct().count() == 1L && !((String)myMap.get(i)).equals("")) {
                    winner = " winner :" + (String)myMap.get(i);
                    resultGame = false;
                } else if (Stream.of((String)myMap.get(5), (String)myMap.get(1), (String)myMap.get(9)).distinct().count() != 1L && Stream.of((String)myMap.get(3), (String)myMap.get(7), (String)myMap.get(5)).distinct().count() != 1L) {
                    if (turnHistory.size() == 9) {
                        winner = "no winner  ";
                        resultGame = false;
                    }
                } else {
                    winner = " winner :" + (String)myMap.get(5);
                    resultGame = false;
                }
            }
        }

        if (!resultGame) {
            myMap.clear();
        }

        request.setAttribute("resultGame", resultGame);
        request.setAttribute("error", winner);
        request.setAttribute("line", lines);
        request.setAttribute("column", column);
        request.setAttribute("result", myMap);
        request.setAttribute("history", turnHistory);
        return "PlayingFlied";
    }
}
