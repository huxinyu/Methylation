package mas;

import java.io.*;

/**
 * Created by lily on 11/3/16.
 */
public class FileTools {
    public void read(String readPath,String writePath) {
        try {
            File f = new File(readPath);
            if (f.isFile() && f.exists()) {
                InputStreamReader read = new InputStreamReader(new FileInputStream(f), "UTF-8");
                BufferedReader reader = new BufferedReader(read);
                String line;
                String output;
                int count=0;
                while ((line = reader.readLine()) != null) {
                    output=null;
                    count++;
                    String s[]= line.split("\t");
                    if(count==1){
                        output="Gene"+"\t"+"value"+"\r\n";
                        write(writePath, output);
                    }
                    else {
                        double pvalue1 = Double.parseDouble(s[5]);
                        double pvalue = pvalue1 /10;
                        output = s[10] + "\t" + "1e-" + pvalue + "\r\n";
                        write(writePath, output);
                    }
                }
                read.close();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void write(String writePath, String writeTxt) {
        try {
            File f = new File(writePath);
            if (!f.exists()) {
                f.createNewFile();
            }
            //    OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
            //    BufferedWriter writer = new BufferedWriter(write);
            FileWriter writer=new FileWriter(f,true);
            writer.write(writeTxt);
            //  writer.write(writeTxt);
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
