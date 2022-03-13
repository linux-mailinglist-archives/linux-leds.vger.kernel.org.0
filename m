Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33784D781C
	for <lists+linux-leds@lfdr.de>; Sun, 13 Mar 2022 21:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234548AbiCMUGC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Mar 2022 16:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbiCMUGC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Mar 2022 16:06:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E912AE32
        for <linux-leds@vger.kernel.org>; Sun, 13 Mar 2022 13:04:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n19so23689870lfh.8
        for <linux-leds@vger.kernel.org>; Sun, 13 Mar 2022 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=united-earth-jp.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:date:message-id:subject:to
         :content-transfer-encoding;
        bh=p4fJRngGgpGY7xzOvYB4iVk1ZX8ZWvU9I/UbhByrFZ4=;
        b=3A4PggXGFYqwrBkMxfRtK7r6iPIEC3BzmlfFDnIO012TqT3Zb3mio20/YxfWoKPjLw
         cS14lO550TzNMe/oQRiIuJ03EDrkT5nGqX4Yc4fmnYApqwfc7BH1MrCGqVPNwyBLmUyk
         bZG2N0jtrzwixR16n5EkAroEhVbF6DeM0rLMuXXugmLJbAkqF6JJpGM/R/zGVq9IMCil
         bL7edChMv6Uvf1UDAW6KtcMGJfmml7JzlGhU9pBOWpCl3/MwwSHhmP2PaBTJ+T6PMvS9
         SPXoeZUVqf1Y6+04lUY4Nmhqi2jL4u2eJ3VAV/aw7aYC/F3UblwDVc0+b88gPebXgVaL
         RkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to
         :content-transfer-encoding;
        bh=p4fJRngGgpGY7xzOvYB4iVk1ZX8ZWvU9I/UbhByrFZ4=;
        b=Vy1J5Qpk9igBGIHWfgNMqfgHgdGmlwsaqb7wKc5m/GevPqiPeXN5Z7ml9SDBOPnGfd
         T1HbaFpsqYm/CaVgdweMW3YRrocDZsPTYmeOvCO/xqNsKKKB2SSaiH8a78RyIwqTvQwz
         KVQ8WCXjXkH+qxPkOQ/ZBwauW6pQKDsJ6KHMAU/Ooy9iKFSDwTeZMv1G1eE740tbI97R
         Y3t1RciYMtiV/IooYgXCRfthIcC5NsZZIAs6GKX9O3N8YDGOEhzH7DIENoQBW7PK+7rp
         MrIdqKu0M0+ohdnfk+0LacgdPd0UHGMB7LYzTSHjJa4MTT7eiKF0oM2SrfJwGrZP9fF1
         W4/Q==
X-Gm-Message-State: AOAM5322GuydATyJDDUVvh0zElvV9xsY0VyVOymq1EbKsk0DslE060fu
        8aQBTnt4xL1jsLaygEtRjYc7xum7btcs5cJtF6dhnB4ZrRWrug==
X-Google-Smtp-Source: ABdhPJyrYFH/HPoU/rDSaInK7PgVqlVJCr1jq2obUhDyEF/BR0L81lM7dRfV/4LBb5y6FiEOaVdMPoMfSwSv6d8KFMg=
X-Received: by 2002:a19:6a0e:0:b0:443:3b15:4345 with SMTP id
 u14-20020a196a0e000000b004433b154345mr11767838lfu.388.1647201889907; Sun, 13
 Mar 2022 13:04:49 -0700 (PDT)
Received: from 601147792955 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 13 Mar 2022 13:04:49 -0700
From:   =?UTF-8?B?44Om44OK44Kk44OG44OD44OJ44O744Ki44O844K544Ob44O844Og44Oa44O844K4?= 
        <webpost@united-earth.jp>
X-Mailer: WPMailSMTP/Mailer/gmail 3.3.0
MIME-Version: 1.0
Date:   Sun, 13 Mar 2022 13:04:49 -0700
Message-ID: <CAFsp5GiJ65cMv16KK3v=FJv60EgXp9poeZPE54qhyu2_Y90nrg@mail.gmail.com>
Subject: =?UTF-8?B?c29tcmFtbU5QT+azleS6uuODpuODiuOCpOODhuODg+ODieODu+OCouODvOOCueOCiOOCig==?=
        =?UTF-8?B?5o6n44GI44Oh44O844Or44Gn44GZ?=
To:     linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

44GT44Gu5bqm44Gv44CB54m55a6a6Z2e5Za25Yip5rS75YuV5rOV5Lq644Om44OK44Kk44OG44OD
44OJ44O744Ki44O844K544Gr44GK5ZWP44GE5ZCI44Gb44GE44Gf44Gg44GN44CB6Kqg44Gr44GC
44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuS4i+iomOWGheWuueOBq+OBpuaJv+OC
iuOBvuOBl+OBn+OAgg0KDQrlvozml6XjgIHmi4XlvZPjgojjgorjgZTpgKPntaHjgZXjgZvjgabj
gYTjgZ/jgaDjgY3jgb7jgZnjga7jgafjgIHku4rjgZfjgbDjgonjgY/jgYrlvoXjgaHkuIvjgZXj
gYTjgb7jgZvjgIINCg0KDQrjgYrlkI3liY0NCvCfjZMgU2FtYW50aGEgd2FudCB0byBtZWV0IHlv
dSEgQ2xpY2sgaGVyZTogaHR0cHM6Ly9jbGNrLnJ1L2RtazhBP2RmNW13IPCfjZMNCg0K5LyB5qWt
5ZCN44O76YOo572y5ZCNDQo4dXRxcXQNCg0K44Oh44O844Or44Ki44OJ44Os44K5DQpsaW51eC1s
ZWRzQHZnZXIua2VybmVsLm9yZw0KDQrpm7voqbHnlarlj7cNCjIwMzY4MTUxOTIzOA0KDQrlj5bm
nZDmpoLopoHjg7vjg4bjg7zjg54NCnNvbXJhbW0NCg0K5Y+W5p2Q5YaF5a65DQpbdHlvdXItbWVz
c2FnZV0NCg0KDQotLQ0K44GT44Gu44Oh44O844Or44GvIOeJueWumumdnuWWtuWIqea0u+WLleaz
leS6uuODpuODiuOCpOODhuODg+ODieODu+OCouODvOOCuSAoaHR0cHM6Ly91bml0ZWQtZWFydGgu
anAvd3BzaXRlKSDjga7jgYrllY/jgYTlkIjjgo/jgZvjg5Xjgqnjg7zjg6DjgYvjgonpgIHkv6Hj
gZXjgozjgb7jgZfjgZ8NCg==
