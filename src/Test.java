import java.util.*;
public class Test {
    public void dan(int n){
        for(int i = 1; i< 10; i++){
            System.out.println(n*i);
        }
    }
    public static void main(String[] args) {
        HashMap<String, String> map = new HashMap<>();
        map.put("people","사람");
        map.put("baseball","야구");
        ArrayList<String> keyList = new ArrayList<>(map.keySet());
        String[] data = {"123","456","789"};
        List<String> list = new ArrayList<String>();
        list.add("a");
        list.add("b");
        list.add("a");
        list.add("c");
        HashSet<String> set = new HashSet<>(list);
        HashSet<String> helloSet = new HashSet<>(Arrays.asList("H","e","l","l","o"));
        System.out.println(helloSet);
    }
}
