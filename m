Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B680393F48
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhE1JIa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235358AbhE1JIQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD91FC061348
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:39 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so1973649wmf.1
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+f864LGvURQSeroBuuxgBe/TOHz+dhRDDdewVQSqGw=;
        b=IRUgGQMuE35gabK+9D3iSckXRcFnziOwB3UBmxCujDK2rnq35LY4NEalWzCpf53BQQ
         7zvMHb61lSK3ANth9tEPXif/8oN6PHAvqUbvqQQh66wWcdjBWtKvwkHUx6STQZ+DBmYs
         ex9Pl+kgJ87rrBGsIN00gWjJrhFdCJeOiEWvyFKqRAfyTHHFcenwMIs6+CQImG+1V/0l
         cLGpoNcBpNZM21oSFFYk3ygS2wy8/5D98+YEh1Nm79I4a/AgxWjvdrM5T8p3GAwBchE+
         i+AyQFoYRFrPsiUxzOAg+4mC2mhq3psKhakJgOnW+Qz68bGPgNuYXU5XI79QPA5SCbRZ
         Y9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+f864LGvURQSeroBuuxgBe/TOHz+dhRDDdewVQSqGw=;
        b=BqTWFY8Vd9odIcI34ci1Y9Mrdp0jQJFsY89L++x5gwCopkjeIcfBxtf6ZHVCEXkIBV
         1jWHvH/+u2gf87Xn2v82IlMxW4HkXjw7xIzjnaQ/pNRIQaF3Q/iQtnS7kGZ/zwpwdkWN
         Kq/pU7Eugf6K9Du9efwvEFCMrrG595peD+wkUjok/OS/5dTLrHj9apmub6kDHUZ+Gk17
         gr2iv6nunj4ooHV8hFsD3UQ/cfysmPAT+4t1m3YEnwMfveaJxg8J0BfopoSx+pLkE5Rv
         tMlT7vSqkqPleWlOWY2CK46cC5z/rY+dPrj6p1SyJAMFbFGHSJQx1LiXo62vHmdY9rCB
         o1Ew==
X-Gm-Message-State: AOAM5328ovhxR1DpgNZvGZKJH/H3bzWmYX5DsheszIG+7+DCnePCCD0/
        GIrbqcBxH3xDlT5wLh2mhlMofw==
X-Google-Smtp-Source: ABdhPJwGJNzYH6nkYUO98hgq1gaLfYj/RVSnIRjjzE36nCTV0+mrc+tNlN+WJI9KuX9E9UMwRTjluw==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr7497930wmc.122.1622192798448;
        Fri, 28 May 2021 02:06:38 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:37 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jan-Simon Moeller <jansimon.moeller@gmx.de>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>,
        linux-leds@vger.kernel.org
Subject: [PATCH 06/15] leds: leds-blinkm: Remove unused variable 'ret'
Date:   Fri, 28 May 2021 10:06:20 +0100
Message-Id: <20210528090629.1800173-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528090629.1800173-1-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Function returns void anyway.

Fixes the following W=1 kernel build warning(s):

 drivers/leds/leds-blinkm.c: In function ‘blinkm_init_hw’:
 drivers/leds/leds-blinkm.c:483:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Jan-Simon Moeller <jansimon.moeller@gmx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: "Jan-Simon Möller" <dl9pf@gmx.de>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/leds/leds-blinkm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index b4e1fdff4186a..bd7d0d5cf3b62 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -480,9 +480,8 @@ static int blinkm_led_blue_set(struct led_classdev *led_cdev,
 
 static void blinkm_init_hw(struct i2c_client *client)
 {
-	int ret;
-	ret = blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
-	ret = blinkm_transfer_hw(client, BLM_GO_RGB);
+	blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
+	blinkm_transfer_hw(client, BLM_GO_RGB);
 }
 
 static int blinkm_test_run(struct i2c_client *client)
-- 
2.31.1

