Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CAA72DA18
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jun 2023 08:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239362AbjFMGrN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Jun 2023 02:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238754AbjFMGrL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jun 2023 02:47:11 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE221BC7
        for <linux-leds@vger.kernel.org>; Mon, 12 Jun 2023 23:47:01 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f8d2bfec9bso523285e9.0
        for <linux-leds@vger.kernel.org>; Mon, 12 Jun 2023 23:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686638819; x=1689230819;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02cZUxsOqGfZ8lXmchHjzAFGxYbEcf/VDvBL7ckHl/M=;
        b=hKm0C1CuMJaIu2eNk6rIDpUz1RWQ/iGh9mP7XAV/Qht00URUaHpXipQXWiXvxvxQ10
         jc1Hm2Ewm9nsGigWSZ4P7mjQNRH606pxCpTGwkHFQ9+1tCEge7+8nUmnl5Sd9Ra7r7xq
         YpVPe/OPAIkKEfcWGUR4VPYS5D4pf6kB5g0Bwtgz831JXhToLyyfY6fDsQUPzaZTY0Pm
         PDYGSEk/qV3XPF97oPZUD3EDOmpUbIYpjU0dnXiIhtTPpOZeMiNqgUnSVoddTRAhk+rM
         bBEuW4yf1lm/ZMz0yb4IfOLXRCQUzhdt1aYcM0aEMVDEkFIyZ+rYrFk+E93zjGRehG+3
         sr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686638819; x=1689230819;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02cZUxsOqGfZ8lXmchHjzAFGxYbEcf/VDvBL7ckHl/M=;
        b=kWtclIP3LNRy3U/qWbKxO3AlzdHY/hG6n+E7dhvBt5WaKItbIocaZEJCK5/MRJwQhu
         hSbV5cjIE3/R7DOI5F+i1sz9U7fEQLEzlTABEiUQUU/NLjhExA0qWHvI6lMR6G57DQGs
         eUlDGjEgb7pW6KUyEdZR10BnKFGmS5BjQ9e1TuTZGQQ1a+JBbUuL3Z2BQDSxCXN4i6RK
         qGadRw9OizPCUJ+kAsJCTOA/Kxhe0Ht9Jwx4g6ULWPDuE4qHWtlUB+iJfavX9SyzWddZ
         DQHE3O5Wf8GAADUk7RMtRPDu/8GeEQh63UWYYHatzvtPm3RJ3kA5QhfuR/O8FDYmvA2T
         hOAw==
X-Gm-Message-State: AC+VfDwbLfQKiv4QTYCVQ/TDeQ+n8pODLVVMYey9PlM4scEGSWlkEEEC
        UkvdLZbW0JevT4w3qyhJU1pNUg==
X-Google-Smtp-Source: ACHHUZ7jLXGNINNFmi15PwujwvIU2N90t+1cq56bMQ/WiVjOp1HKtrySJyLsof5kHSHuUy2YkGQ3YA==
X-Received: by 2002:a7b:c349:0:b0:3f7:408e:b89b with SMTP id l9-20020a7bc349000000b003f7408eb89bmr9070856wmj.33.1686638819250;
        Mon, 12 Jun 2023 23:46:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c228b00b003f7361ca753sm13326057wmf.24.2023.06.12.23.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 23:46:57 -0700 (PDT)
Date:   Tue, 13 Jun 2023 09:46:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v2 led] leds: trigger: netdev: uninitialized variable in
 netdev_trig_activate()
Message-ID: <6fbb3819-a348-4cc3-a1d0-951ca1c380d6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
---
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

