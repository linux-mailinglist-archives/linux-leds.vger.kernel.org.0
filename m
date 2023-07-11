Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA2A74E922
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jul 2023 10:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjGKIb1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jul 2023 04:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjGKIb0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jul 2023 04:31:26 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB320BF
        for <linux-leds@vger.kernel.org>; Tue, 11 Jul 2023 01:31:25 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso30539525ad.2
        for <linux-leds@vger.kernel.org>; Tue, 11 Jul 2023 01:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689064285; x=1691656285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rofOJD2PEXHX+UfeHTQCqCECMr9/lYMQMtv8+LwhAUQ=;
        b=P6A0pA9ITf6al+15du8ek7nlPUlClDBxUH1hZIB1C9IlYHPFlUbaVUPv4aE8lRt+H9
         9urxpsHuYPzrnVXITxB0swQsGpnoTyvhAgWnCjLNTc8k27WUvzQdiVQ5NT1beq+MN8is
         1aXkZZsDeaP+/iP91u7UBNkcezZh5pG7bP188=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689064285; x=1691656285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rofOJD2PEXHX+UfeHTQCqCECMr9/lYMQMtv8+LwhAUQ=;
        b=B5T/awS7xhDkgTD8CDr7DoWLIag1baiDqiOguD6gmkBRqNYqDr9wBWOalk+WEZun3I
         AfO6a6E4PqZcBLiJ145N0/BEjiZWahoIyr/jAjExjJhJb8qHxXE92xNrVU2GCdRjA21j
         2weG7zIMpEc4Wrhguw3qqTS16W5AYhtF6JKRGfofCMeYFwluw2cJOzUy7woAOB7mEbgD
         dPo1alysLCQW/mJaTGXnzX3KdTchWTSMe6GBFeXe3EANHIAziykxjn7aKXQwuj1cOoFY
         t8uRjaLeAvzm70PlFg82NvWVZm4PepsdKJDWKedsFD18kGxiEUgE9sQiHG2r63v0mVgr
         EI3w==
X-Gm-Message-State: ABy/qLZu9tXjaZ+JTeYDsEKmE4OlIyev18DoC9K3Sz+zWoj4kbtpsaYw
        pyHEN0sEqFK6zpTyp2lnYQjaTW33UaEEuIljl6o=
X-Google-Smtp-Source: APBJJlEVuRnWrgPtRHxfnSweZ6D18Mv5lFZ8nOu/CVG5UPhpVA599ndJjMw/jfjqWUfqQBYnnxvqzw==
X-Received: by 2002:a17:903:41c8:b0:1b8:a73e:aaac with SMTP id u8-20020a17090341c800b001b8a73eaaacmr21002030ple.62.1689064285198;
        Tue, 11 Jul 2023 01:31:25 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4de:ea8b:eb72:c51d])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902b20800b001b89466a5f4sm1273471plr.105.2023.07.11.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:31:24 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Lee Jones <lee@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Fei Shao <fshao@chromium.org>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH] leds: pwm: Fix an error code
Date:   Tue, 11 Jul 2023 16:30:41 +0800
Message-ID: <20230711083055.1274409-1-fshao@chromium.org>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the negated -EINVAL as the error code.

Fixes: 95138e01275e ("leds: pwm: Make error handling more robust")
Signed-off-by: Fei Shao <fshao@chromium.org>

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
2.41.0.390.g38632f3daf-goog

