require("ldb")
ldb.ldb_open()
class test
{
    int a;
    int b;
    test(int aa,int bb)
    {
        a = aa;
        b = bb;
    }
    int add()
    {return a+b;}
}
public class hehe
{
    public static void main(String args[])
    {
        int a = 2;
        int b = 3;
        int c= a+b;
        System.out.println(c);
        test kk=new test(1,2);
        System.out.println(kk.add());
    }
}