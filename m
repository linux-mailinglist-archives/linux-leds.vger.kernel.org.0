Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44CA72F566
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jun 2023 09:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjFNHFJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Jun 2023 03:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243102AbjFNHEO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Jun 2023 03:04:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3526199C
        for <linux-leds@vger.kernel.org>; Wed, 14 Jun 2023 00:04:05 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f8d17639feso4023055e9.2
        for <linux-leds@vger.kernel.org>; Wed, 14 Jun 2023 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686726244; x=1689318244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqIK+JrRD/w1Gt88Di+paTgCGEYvpSh0GC+h6+bW3yw=;
        b=iCwy9RDb84tB4kdaKWth75H7OmawV3HZ4X8FhNc+nYNfBbl/NigevNY/cmxfdscO0/
         fWJemgiaosp8IDhkT1QFQ3X3IYVZX0YwkqV3NwXl37UlyxA0FuiADy8+ecyuDFgFz6nk
         16CcxdUdY4+zxFszfXkIcovxD6xSspKN5w69rcVQTmVkYIyynXMLSoUm0oPr7NxSDt/C
         wh7UwBq7F78RofgfuiAP19lEm2Qgk6mbTIKf74/M23O1W+cvGc5Vo3PIYrxH5FwLhuH+
         TFOLfgS2mE4VbygkDAhE4HEeuKDRZYQUekm4flyfOoA+KxExoXZO8V7Uy58Z3wyapbVK
         Ay8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686726244; x=1689318244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqIK+JrRD/w1Gt88Di+paTgCGEYvpSh0GC+h6+bW3yw=;
        b=JiGd+J/ViKw6R2INq4jj/BPTzHyAr9MjRlLCRuVrd1GXVjnw6JHnwk5AIWeanj/9KP
         /yCwlbqH2ZUg3pybTj6oftNRhEbx+xsQBqK4Xiw1yoNU1zv4AbI7yrNKbsg8+2vJn6rO
         3UiA/dLWYSUHvRdX1WbDB7JbcHq5U5NzVFYR4jFHNqV++bXxnRHPqxw6OtjNxoJrogaO
         ZniwK0arXqGYr2jJIGncAEvjKZ4zvBMxL+xgLhVfGY2OyS71UiWlkNxUA2l8Y4dXocLF
         UHcqIyxfYDJd3pBiK9gEFl8xM5ih3Dn/MzFOez/Tnfd27bvtfd8qf9RPj1sFbBD2T4nY
         nbIQ==
X-Gm-Message-State: AC+VfDypmNUSWFNJ3bj34B7jU0QvcAkQAE6EsjtzgTiss4NGAIpc32w5
        y07wUQZTwEDl+lGOw21H3pViIw==
X-Google-Smtp-Source: ACHHUZ6oGuWWPlZXUkigPMZkc4obcChtgd4nGGd8losWL+Kf8Mic51FCYSQDA7U2hPFcoyYH0McUmg==
X-Received: by 2002:a1c:ed06:0:b0:3f7:f584:5796 with SMTP id l6-20020a1ced06000000b003f7f5845796mr11528366wmh.2.1686726244098;
        Wed, 14 Jun 2023 00:04:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k15-20020a7bc40f000000b003f7f1b3aff1sm16475105wmi.26.2023.06.14.00.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 00:04:02 -0700 (PDT)
Date:   Wed, 14 Jun 2023 10:03:59 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        netdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net-next resend] leds: trigger: netdev: uninitialized
 variable in netdev_trig_activate()
Message-ID: <ZIlmX/ClDXwxQncL@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The qca8k_cled_hw_control_get() function which implements ->hw_control_get
sets the appropriate bits but does not clear them.  This leads to an
uninitialized variable bug.  Fix this by setting mode to zero at the
start.

Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Resending because this actually goes through net-next and not the led
subsystem.

v2: In the original patch I fixed qca8k_cled_hw_control_get() instead
so that patch went to netdev instead of to the led subsystem.
https://lore.kernel.org/all/5dff3719-f827-45b6-a0d3-a00efed1099b@moroto.mountain/
Fixing it here is a more reliable way to do it.

 drivers/leds/trigger/ledtrig-netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index b0a6f2749552..2311dae7f070 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -445,7 +445,7 @@ static void netdev_trig_work(struct work_struct *work)
 static int netdev_trig_activate(struct led_classdev *led_cdev)
 {
 	struct led_netdev_data *trigger_data;
-	unsigned long mode;
+	unsigned long mode = 0;
 	struct device *dev;
 	int rc;
 
-- 
2.39.2
