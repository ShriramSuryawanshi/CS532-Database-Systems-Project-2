/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*  CS 532 - Project 2 (Spring 2018)
*   1. Shriram Suryawanshi
*   2. Vinen Furtado
*/

package minipods;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.pool.OracleDataSource;

/**
 *
 * @author shree
 */
public class Login extends javax.swing.JFrame {

    /**
     * Creates new form Login
     */
    public String user;
    public String pass;
    Connection conn;

    public Login() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        P_Login = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        T_Username = new javax.swing.JTextField();
        jSeparator3 = new javax.swing.JSeparator();
        jLabel7 = new javax.swing.JLabel();
        jSeparator4 = new javax.swing.JSeparator();
        T_Password = new javax.swing.JPasswordField();
        B_Login_Login = new javax.swing.JButton();
        B_Cancel_Login = new javax.swing.JButton();
        L_Error_Login = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("MiniPods - Login");
        setLocation(new java.awt.Point(400, 300));
        setResizable(false);
        addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentShown(java.awt.event.ComponentEvent evt) {
                formComponentShown(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Arial Rounded MT Bold", 0, 36)); // NOI18N
        jLabel1.setText("MiniPods");

        P_Login.setBackground(new java.awt.Color(0, 204, 204));
        P_Login.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));

        jLabel2.setFont(new java.awt.Font("Montserrat", 0, 14)); // NOI18N
        jLabel2.setText("Please enter your bingsuns database details to proceed - ");

        jLabel6.setFont(new java.awt.Font("Montserrat", 1, 14)); // NOI18N
        jLabel6.setText("Username - ");

        T_Username.setBackground(new java.awt.Color(0, 204, 204));
        T_Username.setFont(new java.awt.Font("Montserrat", 0, 14)); // NOI18N
        T_Username.setBorder(null);
        T_Username.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                T_UsernameFocusGained(evt);
            }
        });

        jSeparator3.setForeground(new java.awt.Color(255, 255, 255));

        jLabel7.setFont(new java.awt.Font("Montserrat", 1, 14)); // NOI18N
        jLabel7.setText("Password - ");

        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));

        T_Password.setBackground(new java.awt.Color(0, 204, 204));
        T_Password.setAutoscrolls(false);
        T_Password.setBorder(null);
        T_Password.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                T_PasswordFocusGained(evt);
            }
        });

        B_Login_Login.setFont(new java.awt.Font("Montserrat", 1, 15)); // NOI18N
        B_Login_Login.setForeground(new java.awt.Color(0, 102, 102));
        B_Login_Login.setText("Login");
        B_Login_Login.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        B_Login_Login.setOpaque(false);
        B_Login_Login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                B_Login_LoginActionPerformed(evt);
            }
        });

        B_Cancel_Login.setFont(new java.awt.Font("Montserrat", 1, 15)); // NOI18N
        B_Cancel_Login.setForeground(new java.awt.Color(0, 102, 102));
        B_Cancel_Login.setText("Cancel");
        B_Cancel_Login.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        B_Cancel_Login.setOpaque(false);
        B_Cancel_Login.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                B_Cancel_LoginActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout P_LoginLayout = new javax.swing.GroupLayout(P_Login);
        P_Login.setLayout(P_LoginLayout);
        P_LoginLayout.setHorizontalGroup(
            P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(P_LoginLayout.createSequentialGroup()
                .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, P_LoginLayout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(B_Login_Login, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(B_Cancel_Login, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(P_LoginLayout.createSequentialGroup()
                        .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(P_LoginLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jLabel2))
                            .addGroup(P_LoginLayout.createSequentialGroup()
                                .addGap(171, 171, 171)
                                .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(P_LoginLayout.createSequentialGroup()
                                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                            .addComponent(jSeparator4)
                                            .addComponent(T_Password, javax.swing.GroupLayout.PREFERRED_SIZE, 289, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                    .addGroup(P_LoginLayout.createSequentialGroup()
                                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                            .addComponent(jSeparator3)
                                            .addComponent(T_Username, javax.swing.GroupLayout.PREFERRED_SIZE, 289, javax.swing.GroupLayout.PREFERRED_SIZE))))))
                        .addGap(0, 290, Short.MAX_VALUE)))
                .addContainerGap())
        );
        P_LoginLayout.setVerticalGroup(
            P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(P_LoginLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addGap(44, 44, 44)
                .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(T_Username, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator3, javax.swing.GroupLayout.PREFERRED_SIZE, 2, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(40, 40, 40)
                .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(T_Password, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator4, javax.swing.GroupLayout.PREFERRED_SIZE, 2, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 86, Short.MAX_VALUE)
                .addGroup(P_LoginLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(B_Login_Login, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(B_Cancel_Login, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        L_Error_Login.setFont(new java.awt.Font("Montserrat", 0, 14)); // NOI18N
        L_Error_Login.setForeground(new java.awt.Color(255, 0, 0));
        L_Error_Login.setText("Please enter your bingsuns database details to proceed - ");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(P_Login, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(346, 346, 346)
                                .addComponent(jLabel1)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(L_Error_Login, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(P_Login, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(L_Error_Login)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        getAccessibleContext().setAccessibleName("MiniPods-LOGIN");

        pack();
    }// </editor-fold>//GEN-END:initComponents


    private void B_Login_LoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_B_Login_LoginActionPerformed

        if (T_Username.getText().equals("")) {
            L_Error_Login.setText("Please enter username!");
            L_Error_Login.setVisible(true);
        } else {

            // @@ - perform login operation
            try {

                this.user = T_Username.getText();
                this.pass = new String(T_Password.getPassword());

                // @@ - connect to DB
                OracleDataSource ds = new oracle.jdbc.pool.OracleDataSource();
                //ds.setURL("jdbc:oracle:thin:@localhost:1521:orcl");
                //Connection conn = ds.getConnection("shree", "shree");
                ds.setURL("jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:ACAD111");
                conn = ds.getConnection(user, pass);

                // @@ - login successful, move to Home screen
                if (!conn.isClosed()) {
                    setVisible(false);
                    new Home(user, pass).setVisible(true);
                }

                conn.close();

            } catch (SQLException ex) {
                // @@ - show errors on Login Window
                L_Error_Login.setText(ex.toString());
                L_Error_Login.setVisible(true);
                
                // @shree - handling too many session error by killing conn
                try {
                    conn.close();
                } catch (SQLException ex1) {
                    Logger.getLogger(Login.class.getName()).log(Level.FINE, null, ex1);
                }

            } catch (HeadlessException | NumberFormatException e) {
                // @@ - show errors on Login Window
                L_Error_Login.setText(e.toString());
                L_Error_Login.setVisible(true);
                
                // @shree - handling too many session error by killing conn
                 try {
                    conn.close();
                } catch (SQLException ex1) {
                    Logger.getLogger(Login.class.getName()).log(Level.FINE, null, ex1);
                }
            }
        }
    }//GEN-LAST:event_B_Login_LoginActionPerformed

    private void B_Cancel_LoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_B_Cancel_LoginActionPerformed
        System.exit(0);
    }//GEN-LAST:event_B_Cancel_LoginActionPerformed

    private void formComponentShown(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_formComponentShown

        // @@ - resetting the login window
        T_Username.setText("");
        T_Password.setText("");
        L_Error_Login.setVisible(false);

    }//GEN-LAST:event_formComponentShown

    private void T_UsernameFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_T_UsernameFocusGained

        // @@ - resetting the login window
        L_Error_Login.setVisible(false);
    }//GEN-LAST:event_T_UsernameFocusGained

    private void T_PasswordFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_T_PasswordFocusGained

        // @@ - resetting the login window, clearing the previous password
        T_Password.setText("");
        L_Error_Login.setVisible(false);
    }//GEN-LAST:event_T_PasswordFocusGained

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Login().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton B_Cancel_Login;
    private javax.swing.JButton B_Login_Login;
    private javax.swing.JLabel L_Error_Login;
    private javax.swing.JPanel P_Login;
    private javax.swing.JPasswordField T_Password;
    private javax.swing.JTextField T_Username;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    // End of variables declaration//GEN-END:variables
}
