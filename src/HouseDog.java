public class HouseDog extends Dog{
    public HouseDog(){

    }
    public HouseDog(String name) {
        this.name = name;
    }
    public void sleep() {
        System.out.println(this.name+ "zzz in the house");
    }

    public void sleep(int hour){
        System.out.println(this.name + "zzz in the house" + hour + " hours");
    }

    public static void main(String[] args) {
        HouseDog houseDog = new HouseDog();
        houseDog.name = " asdf";
        System.out.println(houseDog.name);

    }
}
