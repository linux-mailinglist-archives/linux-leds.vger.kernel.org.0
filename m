Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBB573B6EC
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jun 2023 14:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjFWMJx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Jun 2023 08:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFWMJw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Jun 2023 08:09:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B06B172C
        for <linux-leds@vger.kernel.org>; Fri, 23 Jun 2023 05:09:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f769c37d26so679906e87.1
        for <linux-leds@vger.kernel.org>; Fri, 23 Jun 2023 05:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687522187; x=1690114187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INyk+cs8lXfdbKNGqgibtpw8hPpbnH1cZSfvCvkoydI=;
        b=iB4MZJgv9/CLQBd+Py56pjcfSmEYX9ng0/9Dvp43t51K7a7A8ZjkshUMk4zBV8aUPB
         tvDPXfEYdjOqJQvRNrxctjl4q3OaHunU80o6Z+P+M9keuIPeo4z71MRWMfcrn5qrmBYl
         7IFGJy6LtOhDG/SPt6Mp+sP76ALeMxp4Wb6J+lHbTWaz43HzD/wiGkA2YCY4AtOa6iRm
         05TC3m+auLv7WP6DEHFLFOjvLcedkQibQ/Dn5jniPGzvzfIGCyA8SbA/wOXuFPw6GzGR
         jKEkyOdyTOylzX7vxTfUU1fPMv7kgQimEXIB3QM3qwfhGNY07recQgHr3uMhe8dSbdjW
         o+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687522187; x=1690114187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INyk+cs8lXfdbKNGqgibtpw8hPpbnH1cZSfvCvkoydI=;
        b=e2d7QygDbMY5/fR6SYg7zA9KdrrMFdvYWADkb1TbnjbCy+EqorZ20c/PRIWh/XDLv7
         wq1sn+zLu959j6bIwZfm8Y5WX6QoKnbyEWYq+cS5rlMK5GDStoP20SzAARhp1p7NWJYc
         1hwtcBmjepYpVlLs7xhdlzjUcqoQujaTqFLMiAWq/fUlv7C7b0TeA/lRHLwb7EdwkHa2
         Is73ZbwBs2x0BfDwhqBQ6s1Vrn+6NqQH8daKVgUD8kyYMUMQNZpX06lNsKvotghLKxVu
         I5LC340dYDk8RAb5lFV2ux5/+Cn35+kBM+752ijyfLIc3lRWW168PcjWeU/bUJvcUoGz
         Hdzw==
X-Gm-Message-State: AC+VfDz0YqY5FlTuydDZX8zhh6GOve7hD8Z3liFVnBupnYFiLyNdYzNj
        ATCBhcmu2KAive719641w//bzo0ZG41sai3q5ZM=
X-Google-Smtp-Source: ACHHUZ6tjcU/WuZFOxWw0NcfScpJ1hd/rSyIsPE8QHfoMpMzAPstJqG+ZiHoZ6QXgKNk0KW7ewfPKw==
X-Received: by 2002:a05:6512:214c:b0:4f9:61a2:3592 with SMTP id s12-20020a056512214c00b004f961a23592mr3290795lfr.35.1687522187204;
        Fri, 23 Jun 2023 05:09:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g17-20020a7bc4d1000000b003f7f87ba116sm2197500wmk.19.2023.06.23.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:09:44 -0700 (PDT)
Date:   Fri, 23 Jun 2023 15:09:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: aw200xx: Fix error code in probe()
Message-ID: <4d791b69-01c7-4532-818c-63712d3f63e1@moroto.mountain>
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

The "ret" variable is zero/success here.  Don't return that, return
-EINVAL instead.

Fixes: 36a87f371b7a ("leds: Add AW20xx driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/leds/leds-aw200xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 96979b8e09b7..7b996bc01c46 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -368,7 +368,7 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 
 	if (!chip->display_rows ||
 	    chip->display_rows > chip->cdef->display_size_rows_max) {
-		return dev_err_probe(dev, ret,
+		return dev_err_probe(dev, -EINVAL,
 				     "Invalid leds display size %u\n",
 				     chip->display_rows);
 	}
-- 
2.39.2

