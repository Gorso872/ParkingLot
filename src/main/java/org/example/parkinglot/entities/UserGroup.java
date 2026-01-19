package org.example.parkinglot.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;
import jakarta.persistence.Table;

@Entity
@Table(name = "usergroups")
public class UserGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // The field connecting this group to a specific user
    @Column(name = "username", nullable = false, length = 50)
    private String username;

    @Column(name = "user_group", nullable = false, length = 50)
    private String userGroup;

    // Default constructor (required by JPA)
    public UserGroup() {
    }

    // Constructor with fields
    public UserGroup(String username, String userGroup) {
        this.username = username;
        this.userGroup = userGroup;
    }

    // --- Getters and Setters ---

    public Long getId() {
        return id;
    }

    // Note: Setter for ID is often omitted for auto-generated keys

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(String userGroup) {
        this.userGroup = userGroup;
    }

    // --- Optional: toString method for logging/debugging ---

    @Override
    public String toString() {
        return "UserGroup{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", userGroup='" + userGroup + '\'' +
                '}';
    }
}