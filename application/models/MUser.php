<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class MUser extends CI_Model
{

  public $table = 'user';


  function __construct()
  {
    parent::__construct();
    $this->load->database();
  }

  function CheckUser($username, $password)
  {
    $query = $this->db->get_where(
      $this->table,
      array(
        'username' => $username,
        'password' => $password
      )
    );

    if ($query->num_rows() > 0) {
      return true;
    } else {
      return false;
    }
  }

  function get_all_by_username($username)
  {
    $this->db->where('username', $username);
    return $this->db->get($this->table)->row();
  }
  function get_all()
  {
    $this->db->order_by('nama_lengkap', 'ASC');
    return $this->db->get($this->table)->result();
  }
}
