Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7A574E6FB
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jul 2023 08:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjGKGNm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jul 2023 02:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjGKGNl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jul 2023 02:13:41 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A300C4
        for <linux-leds@vger.kernel.org>; Mon, 10 Jul 2023 23:13:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbdfda88f4so54398695e9.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Jul 2023 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056018; x=1691648018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPLq3mFL0M4+F8/eaPvil24gnJ+7oYfuipKnP87baoo=;
        b=qcB2z7TfTRTqPprP2a8lkI/mK5Z6IR7sdVMF8geId4nR3wNqrICL5QXQ3TU2SDaL+9
         dGRbSODeAVAFGnIE1++OxtNi6OQYvzD6jsaTpgGkMtKfs5bf9Jr3yRz0Kmrs1eFJJYDJ
         Oj6JefHISnCK25KyPsizZyI7UFHWqN3UNHx6Z7mF+rw+fs6GwiLll3Y8Lqc55wm30vtJ
         DisceHQkhdDBgpd6dVx1AYABNgTHPekqS+ILPU+wN4QRMikMT62/K4+gvwNmvxEyqiPg
         4EyMS0DMTXRJfF900cdhdAPv9TyYMAD3iNL0akW/8wrG4z1AtdVTNRkbuioxkqNrsC4Y
         Ih9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056018; x=1691648018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPLq3mFL0M4+F8/eaPvil24gnJ+7oYfuipKnP87baoo=;
        b=IgOJV93sE16359s6TaDTHOtShLgSyr7pmsHs5o2ZTiI5fnpCtGWDh9m13//ukNAUVd
         3pNh2q4Id/nJBOfn9IZOkQnUcnpmeV6mv4Ule+zv3+ekRNkdO3A20OEsi/OCPb0NKLYV
         qpKzzZXfMvlv24A2/y7oE9ebJTZQwIO2JbSfFsid8ib4QA+GQ+V/0WuVAaQzhAvuNyXG
         Ct5Rr/ThVErCqWx3i5p4/SMYv8hq7nIjcuMuI7/32UrQVB3BLKdb2AOwAeA//QQA162G
         tso5CySno93+pg0muNlLzscITPj4rG96tJkoVd37gGE47/7be9lCoLnSzu88cxfsiEbe
         u/3A==
X-Gm-Message-State: ABy/qLbFXRYEH2V/nkTf2Wv8yD4TZXI3RuBzz9DHLExTZ7OLd4cyzx8i
        8ZkfRd9Wt0/KzTJ2a9bt2TT8Sg==
X-Google-Smtp-Source: APBJJlE4GjtSNrr15G+2DvaB23MR8AcI58LDqxb/tvkEG0dMyigOCPL9Am6CaeNJTVQmgGyLjsvhRg==
X-Received: by 2002:a5d:51cc:0:b0:314:121d:8cbf with SMTP id n12-20020a5d51cc000000b00314121d8cbfmr8747981wrv.25.1689056018579;
        Mon, 10 Jul 2023 23:13:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b003140fff4f75sm1284637wrs.17.2023.07.10.23.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:13:37 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:13:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: pwm: Fix error code in led_pwm_create_fwnode()
Message-ID: <a33b981a-b2c4-4dc2-b00a-626a090d2f11@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Negative -EINVAL was intended, not positive EINVAL.  Fix it.

Fixes: 95138e01275e ("leds: pwm: Make error handling more robust")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/leds/leds-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 29194cc382af..87c199242f3c 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -146,7 +146,7 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 			led.name = to_of_node(fwnode)->name;
 
 		if (!led.name) {
-			ret = EINVAL;
+			ret = -EINVAL;
 			goto err_child_out;
 		}
 
-- 
2.39.2

