Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F467A27B8
	for <lists+linux-leds@lfdr.de>; Fri, 15 Sep 2023 22:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237126AbjIOUKS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Sep 2023 16:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237325AbjIOUKL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Sep 2023 16:10:11 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E6E2120
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 13:10:06 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-69042d398b1so1169200b3a.0
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808605; x=1695413405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQVzGWkf7HVCqp2OLBRlKNzMbLz4neMZQx2JbqpcRaM=;
        b=lt+q7GPxpB921tTwWGcrV8LRA9Ayx0aYOCsXDLxt9nzla3GPsHC+H393rGekTWjsgv
         tAmGJgXqXoHiX1NRI/O0TJ/hnS0Uk1TH3+F5ZrqRocr6HcyaUE2V5bN4ffTBmWsVvf0C
         ZSipyrvv0A5HaWm43QY9jx1ywKKHTr3zcZPEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808605; x=1695413405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQVzGWkf7HVCqp2OLBRlKNzMbLz4neMZQx2JbqpcRaM=;
        b=L3JQMGo/KcHEuWSyJD96DD+wq/lGcPw1ShIe6pT6nzKSi6Gg90BL5NAm8IztngegGN
         +eIg+MMRu4QZxz2t5ymMLIepJv3Hdu23pLWIlHQSApjYg/72cbZOiSDQKS4v6eE02BX5
         WTIgYY4xyl1haty5mUDf5AAdd7+yltoU6Lnvybwex9t76Cl96gNUdwX5YHRQHNL12rN1
         K7cGxKu9braJuYHh+fvh/bMi++Jw7s2PwqpOXx2R+7gcpM0LastTuMEmCPtYvbzNhUM2
         2vZh5tWBRAeDPsyHCc5l5x+IXg4Wq43awx2UWHS+L5cGvqc+JF21IuS2mwqW97Eq7q/L
         P0lA==
X-Gm-Message-State: AOJu0Yw564T7SxVqENSpuIUYTqW6nkitylhsSFkWWjTo2PLzhkMRgUu2
        8jCPdc66j9UmdKEIGlxmSOqD4w==
X-Google-Smtp-Source: AGHT+IGmItHIYws5zyT5WqbbkI7YE7oVstUZ5sjqy97PsqZuhg23r5YqzwQVqjclJm+2VOByiXr3VA==
X-Received: by 2002:a05:6a00:2386:b0:68f:edfd:2ac6 with SMTP id f6-20020a056a00238600b0068fedfd2ac6mr3092215pfc.0.1694808605765;
        Fri, 15 Sep 2023 13:10:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v2-20020a62a502000000b0066a2e8431a0sm3327325pfm.183.2023.09.15.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:10:05 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kees Cook <keescook@chromium.org>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: [PATCH] leds: gpio: Annotate struct gpio_leds_priv with __counted_by
Date:   Fri, 15 Sep 2023 13:10:04 -0700
Message-Id: <20230915201003.never.148-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=keescook@chromium.org;
 h=from:subject:message-id; bh=g02eNjr5fSoURtZM+k1a/ubK96yp9CuHHEf8Va6oCXs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLoc1T3DPO/feL5xYpcIAm3aABR+QIrhafXXM
 d7a0I9P3G6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6HAAKCRCJcvTf3G3A
 JgF0D/0dSbBzS492RBJC5to7Z7xpPsdhDREw7ReyYb514AFImFYtfefyrXtgazrHIHNZn4m7Az8
 FgRcUDkK3CTgj+V3JKf0wDPP4C/d8PCw+xH7XqaBEW941EUScRUWE2SqLw3gAOc4Aj3IsQJX8Wx
 gtdUmH0UVn3q5MryLs2McFw1Mq30XRTKc/6Q7uHQmbVC4QCRfzQrtCrM1jDpboifV06dq14KF6l
 oEr0YDZ0k3Yeou6mJn/tuI572iYKNb8qB7hDVGmwSg02fz7UiXvg7aphfoNO0ryeNiNiSSTzu+M
 QwKDfckpPlBKFUf6qeZPmQ/Q8bBNMmoADkm4hD3EfjaawXW2FnImRi0badqtgZxk2Xih+NncdqX
 X4MtYVyYMLdV1NCWkISWWNXMdbThdueTVadzPDZW92YPXEsAL6L0nUH5q/ze5r6ioJ2KdWrrQdB
 vzkHeQFOeoCSgE9sVl8DKWCb3ZDTD6CSLyTVJ/OJizlcer9Jw0/Xdn3YRlsAd9hvGuF+oupTKV5
 YcZ6Q1c8U47QRaqFHPP/dhTiLwlA40dJ0mEMg8nl73LW70H11mjwx92hSY1txdMa10UCv+kb8mQ
 UjF1ot4h8AOLsczLvc0cp1Uzxv4ncZryevLgmxtwaewWy/o0g8kZ6dCEc3Ga+/7DhGHPSYRBg8K
 J4iPM9i JX2KsxXA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct gpio_leds_priv.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/leds-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 7bfe40a6bfdd..a6597f0f3eb4 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -142,7 +142,7 @@ static int create_gpio_led(const struct gpio_led *template,
 
 struct gpio_leds_priv {
 	int num_leds;
-	struct gpio_led_data leds[];
+	struct gpio_led_data leds[] __counted_by(num_leds);
 };
 
 static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
-- 
2.34.1

