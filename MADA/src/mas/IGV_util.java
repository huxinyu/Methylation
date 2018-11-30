package mas;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

/**
 * Created by USER on 2017/4/20.
 */
public class IGV_util {

    public void IGV_mapping(String bamFile,String genome,String scope,String path) throws Exception{
        Socket socket = new Socket("127.0.0.1", 60151);
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

        out.println("load "+bamFile);
        String response = in.readLine();
        System.out.println(response);

        out.println("genome "+genome);
        response = in.readLine();
        System.out.println(response);

        out.println("goto "+scope);
        //out.println("goto chr1:65,839,697");
        response = in.readLine();
        System.out.println(response);

        out.println("snapshotDirectory "+path);
        response = in.readLine();
        System.out.println(response);

        out.println("snapshot");
        response = in.readLine();
        System.out.println(response);
    }
    public void IGV_peakcalling(String treatFile,String controlFile,String peakFile,String genome,String scope,String path) throws Exception{
        Socket socket = new Socket("127.0.0.1", 60151);
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

        out.println("load "+treatFile+" , "+controlFile+" , "+peakFile);
        String response = in.readLine();
        System.out.println(response);

        out.println("genome "+genome);
        response = in.readLine();
        System.out.println(response);

        out.println("goto "+scope);
        //out.println("goto chr1:65,839,697");
        response = in.readLine();
        System.out.println(response);

        out.println("snapshotDirectory "+path);
        response = in.readLine();
        System.out.println(response);

        out.println("snapshot");
        response = in.readLine();
        System.out.println(response);
    }

}
