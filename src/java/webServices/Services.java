/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webServices;

import personDetail.Person;
import Credentials.Connect;
import static Credentials.Connect.getConnection;
import java.io.Serializable;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


/**
 *
 * @author c0633648
 */
@SessionScoped
@Path("/advertise")
public class Services implements Serializable{

    @EJB
    Person person;
    
    @GET
    @Produces("application/json")
    public Response get() {
        return Response.ok(getResults("SELECT * FROM person")).build();
    }

    @POST
    @Path("{login}")
    @Consumes("application/json")
    public String getUser(JsonObject json) {
        JsonArray array = null;
        String email = json.getString("email");
        String pass = json.getString("password");

        array = getResults("SELECT * FROM person WHERE email= ? AND password= ?", email, pass);

        for (javax.json.JsonValue jsonValue : array) {
            System.out.println(jsonValue);
        }
        if (array.size() > 0) {
            System.out.println("correct user detail");
            return "success";

        } else {
            System.out.println("incorrect user detail");
            return "fail";
        }
    }

    @POST
    @Consumes("application/json")
    public Response insertPerson(JsonObject json) {
      
        System.out.println("POST method called");
     
        Response result;
        try {
            // JsonObject json = Json.createReader(new StringReader(str)).readObject();
            String name = json.getString("name");
            String email = json.getString("email");
            String pass = json.getString("password");

            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO person (name, email, password) VALUES (?, ?, ?)");
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, pass);
            pstmt.executeUpdate();
            
            person = new Person(json);
            
           
            result = Response.ok(person.toJSON()).build();

        } catch (SQLException ex) {
            result = Response.status(500).entity(ex.getMessage()).build();
        }
        return result;

    }

    public static JsonArray getResults(String sql, String... params) {
        JsonArray json = null;
        try {
            Connection conn = getConnection();
            System.out.println("hello");
            PreparedStatement pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setString(i + 1, params[i]);
            }
            ResultSet rs = pstmt.executeQuery();

            JsonArrayBuilder array = Json.createArrayBuilder();
            while (rs.next()) {
                array.add(Json.createObjectBuilder()
                        .add("id", rs.getInt("personID"))
                        .add("name", rs.getString("name"))
                        .add("email", rs.getString("email"))
                        .add("password", rs.getString("password"))
                );
            }
            json = array.build();
        } catch (SQLException ex) {
            // Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
}
