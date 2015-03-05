defmodule CurlTransformTest do
  use ExUnit.Case

  @buzzfeed "curl 'https://www.facebook.com/plugins/comments.php?api_key=45075597673&channel_url=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter%2FrFG58m7xAig.js%3Fversion%3D41%23cb%3Df461200f4%26domain%3Dwww.buzzfeed.com%26origin%3Dhttp%253A%252F%252Fwww.buzzfeed.com%252Ff1a1c44e1%26relation%3Dparent.parent&href=http%3A%2F%2Fwww.buzzfeed.com%2Fexpresident%2Fthe-ultimate-cat-person-quiz&locale=en_US&mobile=false&numposts=10&sdk=joey&width=625' -H 'accept-encoding: gzip, deflate, sdch' -H 'accept-language: en-US,en;q=0.8' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.76 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'referer: http://www.buzzfeed.com/expresident/the-ultimate-cat-person-quiz' -H 'cookie: datr=gbvcVNt6byDM00tTDUGBFvG8; c_user=1077195868; fr=0iViWj8TPknlGzRgm.AWUYjEedikTd_YEp6Uhj8TxVedU.BU3sDc.4Y.AAA.0.AWU7FO_e; xs=36%3APhvyceLorrblUg%3A2%3A1425505510%3A13527; csm=2; s=Aa7kujs4X5VvzG5G.BU93zm; lu=whW5rEjbkas4XblvGrjJczyw; p=-2; act=1425505600024%2F14; presence=EM425505620EuserFA21077195868A2EstateFDsb2F1424368339709Et2F_5bDiFA2user_3a1B00172269669A2ErF1C_5dElm2FA2user_3a1B00172269669A2Euct2F1425504911004EtrFnullEtwF1539564113EatF1425505618528G425505620182CEchFDp_5f1077195868F5CC' --compressed"

  test "buzzfeed golang" do
    IO.puts @buzzfeed |> CurlTransform.run Golang
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
