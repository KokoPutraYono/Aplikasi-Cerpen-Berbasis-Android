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
    if (!isset( $data['id']) && !isset($data['judul']) && !isset($data['tokohUtama']) && !isset($data['gendre']) 
        && !isset($data['isi']))
    {
        http_response_code(404);
        die(); // receiving the post params
    } 
    else {
        $id = $data['id'];
        $judul = $data['judul'];
        $image = $data['image'];
        $tokohUtama = $data['tokohUtama'];
        $gendre = $data['gendre'];
        $isi = $data['isi'];

        $query = "UPDATE t_cerpen SET `judul` = '$judul', `tokohUtama` = '$tokohUtama', `gendre`='$gendre', `isi` = '$isi', `image` = '$image' WHERE id = $id";
        $result = mysqli_query($conn, $query);
        if ($result){
            $conn->close();
            $response['status'] = 0;
            $response['message'] = "Update berhasil";
            http_response_code(200);
            echo json_encode($response);
            return;
        }else {
            $conn->close();
            $response['status'] = 1;
            $response['message'] = "Update gagal";
            http_response_code(404);
            echo json_encode($response);
        }
    }
?>