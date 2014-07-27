app.controller('MainController', ["$scope", "$http", function($scope, $http) {

    $scope.catTiles = [{title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4ik28q4Rj1r6jd7fo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m0rcgtpwlN1qbd47zo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_mbkwtxLlVp1qejbiro1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m7dyx6y7jQ1qafbq7o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/yHWA4oxH8oq156oxJ4j7Sp5Do1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://27.media.tumblr.com/4DSwfYDboju07j2aGCseCuD8o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/Jjkybd3nS9suvlf4or2k5QZf_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m45vxqv0oC1qze0hyo1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2xiy8ZjQs1qzex9io1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4g9yySgmW1r73wdao1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2tffu3ycO1rnvzfwo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lutn015sMA1qcw3uro1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m3bfryFIHu1qjev1to1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m1mlqdrEB61qze0hyo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lofr08NALw1qij6yko1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m0e7o5pzI51qdvbl3o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lwhfz1aqaz1qbd47zo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2hwna2eYi1r6bovho1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lnovd0I81D1qbe5pxo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m3posztyRr1qg457ro1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2uquy2ghJ1rohhvpo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4j0x1jur21qzcd3bo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4lk6tLlkO1r2h6ioo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lspix48zsM1qzp0s1o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m5ug75DZok1qb406fo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://28.media.tumblr.com/tumblr_ltqx5rLwCM1r2rj8po1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m1kaq5Tn801qejbiro1_r1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2w3najlgm1rtjgcxo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_mcfbqc3yXQ1qjc1a7o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m1731jB2e21rs8lodo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://26.media.tumblr.com/tumblr_lvhadpi6Jb1r2owmbo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_mc9s42klWo1qd477zo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/Jjkybd3nSdhcs56xDfwdg8Gs_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_ksub69yQ0K1qz61r3o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m0hkpb4P2P1qjahcpo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m0l3uxm3R01qejbiro1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lqe87yxkmo1qbe5pxo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4jcbe81H31qmgxdto1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lhh18oJ9dy1qgnva2o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://30.media.tumblr.com/tumblr_m1v2io2SZp1qz8u8ho1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_mcpa8zbbiZ1qze0hyo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/qgIb8tERiqzc1dpu8DC6LEhUo1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lny8fzGQcJ1qzya49o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m4iejjg1xd1qd477zo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m2y7is5sjr1r1rxd0o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_llo6o51ev91qenqklo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://28.media.tumblr.com/tumblr_m39bvdpv7G1rtuomto1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2y3asernu1qbe5pxo1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m83dr91eLt1qzex9io1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m82woaL5AD1rro1o5o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/xnRAFEQXBdtvx568alyD505So1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m18s33hi3b1qbe5pxo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_ly5ya0dlCi1qgfgmzo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lo9avpVJWf1qmjao5o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lfq1vdg51z1qgeo71o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lwasogS2Er1qbhms5o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/Jjkybd3nSnemmknz8Rf4Dl55o1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m1ifukM2Ia1qilf9fo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m0fcrrVjfw1qcaf9go1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_ln3twtMmvE1qbt33io1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lofqz7oJBL1qij6yko1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lhd7yf899D1qgnva2o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_mbbejwlA0q1qejbiro1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lnny3sWw0X1qfqt3oo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m465wgM4rj1qejbiro1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lx5cuqY5HR1qzaz3ro1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_l2p1eqoqDM1qabm53o1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/Jjkybd3nSf6smp2vyHnXv9ego1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_ma1q08dIs01r6jd7fo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_ltqkebmSJT1r4xjo2o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lxlpfhVrGP1r7ryzoo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m1tgc607e61qgo0kqo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://27.media.tumblr.com/tumblr_lv1jwmMpiY1qzbxjgo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lzuvpmpx3D1qgjltdo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m3377ovzZA1qejbiro1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lg1hdzHupr1qfyzelo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://29.media.tumblr.com/tumblr_m2fssjf59l1r6b7kmo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m3fi8r9Vdl1r7s7uao1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lwn44ejOXg1qmjao5o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lwr2002HIG1qa9omho1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4g9o21t1z1r73wdao1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lsyr2nMfYU1r4xjo2o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_ma24zakT361r6jd7fo1_400.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lq1tz9Bj601qenqklo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m2t50bsLKU1qzo3c9o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m49vpxb0zD1qaxs8eo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lxdqgajM5u1qbcporo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lym9ybN5l31qbf0k3o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m0mjsziQTU1r6b7kmo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lti046S9Xe1qmf9gqo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2vytyQkgM1r4sspbo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://29.media.tumblr.com/4RGoOjGMjq9o64nvqqmz7G2Xo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m2zcjzgU4N1qz5xqyo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m1vz4baZzb1qj7z6zo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4rykaaZOB1r6jd7fo1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m3kjdboKpq1qjc1a7o1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_m4sk23YjW81qd477zo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lzv1vkvaK31r6b7kmo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4i88dyXJE1rweruno1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_lyfmcx0aJb1qbbzmpo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://25.media.tumblr.com/tumblr_m4ol0h9JdQ1qd477zo1_1280.jpg", timePublished: "1", newsRank: "1", summary: "xyz"},
                       {title: "Sample Title", source: "Sample", linkUrl: "http://thecatapi.com/", imageUrl: "http://24.media.tumblr.com/tumblr_lhd7ouWse91qgnva2o1_500.jpg", timePublished: "1", newsRank: "1", summary: "xyz"}]
    
    $scope.experiment = 

    $scope.activeTiles = []

    var initializePage = function() {
        for (i = 0; i < 30; i++) {
            $scope.activeTiles.push($scope.catTiles[i])
        }
    }

    initializePage()

    $scope.loadMoreTiles = function() {
      console.log("hey")
        var lastTile = $scope.activeTiles.length
        for (i = 0; i < 9; i++) {
            if ($scope.activeTiles.length < $scope.catTiles.length) {
                $scope.activeTiles.push($scope.catTiles[i + lastTile])
            }
        }
    }

}]);