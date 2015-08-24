import java.io.*;

public class Demo {
  int puppyAge;

  public Demo(String name){
    System.out.println("Passed Name is :" + name );
  }

  public void setAge( int age ){
    puppyAge = age;
  }

  public int getAge( ){
    System.out.println("Puppy's age is :" + puppyAge );
    return puppyAge;
  }

  public static void main(String []args){
    /* Object creation */
    Demo myPuppy = new Demo( "tommy" );

    /* Call class method to set puppy's age */
    myPuppy.setAge( 2 );

    /* Call another class method to get puppy's age */
    myPuppy.getAge( );

    /* You can access instance variable as follows as well */
    System.out.println("Variable Value :" + myPuppy.puppyAge );
  }
}
