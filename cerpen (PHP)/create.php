<?php
    // required headers
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: access");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Credentials: true");
    header('Content-Type: application/json');

    // include database and object files
    include_once 'connection.php';
    $data = json_decode(file_get_contents('php://input'), true);
    if (!isset($data['judul']) && !isset($data['tokohUtama']) && !isset($data['gendre']) && !isset($data['isi']))die(); // receiving the post params
    else
    {

        $judul = $data['judul'];
        $tokohUtama = $data['tokohUtama'];
        $image = $data['image'];
        $gendre = $data['gendre'];
        $isi = $data['isi'];

        $query = "Select judul FROM t_cerpen WHERE `judul` = '$judul'";
        $result = mysqli_query($conn, $query);

        $row = mysqli_fetch_assoc($result);
        if ($row != null){
            $response['status'] = 0;
            $response['message'] = "judul sudah terdaftar, Periksa Kembali judul anda " . $row["judul"];
            http_response_code(201);
            echo json_encode($response);
            return;
        }
      
        else {
            $query = "INSERT INTO t_cerpen(judul, tokohUtama, gendre, isi, image) VALUES (
            '$judul', '$tokohUtama', '$gendre', '$isi', '$image')";
            if ($conn->query($query) === TRUE){
                $conn->close();
                $response['status'] = 0;
                $response['message'] = "Register User baru telah berhasil
                didaftarkan";
                http_response_code(200);
                echo json_encode($response);
            }
            else {
                $conn->close();
                $response['status'] = 1;
                $response['message'] = "Register User baru gagal";
                http_response_code(404);
                echo json_encode($response);
            }
        }

    }
?>
