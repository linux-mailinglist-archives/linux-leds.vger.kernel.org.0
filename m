Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B84393F41
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhE1JI0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhE1JIO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B647C061343
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id z17so2526502wrq.7
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Tpxvrezbz4fVWqGXP5tr+bw/T66XdtDTRoAL/D3c3I=;
        b=At/x6PPBZ6tyK40CZRLPAWb+hzicYLlGXMkRZufynn55TwTjfK/ktiwzgnRY+y39Ao
         z37YAD/D6RCb/kutzgS6QxDYg7TZrYLeLNWAyi9ah5t4g85xxzgoBzXusu+blHsialHo
         gA1RimDyapBS2fw/JcIE+Kmwv0GO/HL7+JrfjyU1sgSWlKJLyVEmlUEHkhoqiG6D2K9C
         NbX4pmCw8KSAb++U1MfHZJwTnpYBADSARDCmwnCt/ZRuV3+S3WZaLZoJKJFO9LcZOHO1
         pcEC4Y7MifaWhlKAolq2tGwHtaV8y2xuUovjn3mCPidIZYPdLnvLLnS/jQ/PG2ptfJN2
         0uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Tpxvrezbz4fVWqGXP5tr+bw/T66XdtDTRoAL/D3c3I=;
        b=VXjX8S1mIyj+EbmXtitqLqOnCMbOt/fPv3gDwQjTmy67+ZekrTeA9tAoJ7JKY3QNkr
         fVS+56Ixr3Z/zmogYMkziAuJmWDaBp381HUcUsX1gFChqJ6T7FmW1DemxyTfgK2ynakn
         51x1VBfI21/ZI1f6g6xPp41udhY2AfMva77sKzlT3Xk7RMT8g53pQ2dwSVtkoa2pjO6P
         yrckngudn7enJi7nwaV7oY9aq5moYoSHJU7j7EQ9Hag7WeWjaKnEoJK3S3LLULi3Jaeb
         mvpfDPPr3Bs/S2YLez+/aW06yf0GADBPx/cR/du9alAC59RYGSOyEI75d6dyUBdDmrCk
         GwWg==
X-Gm-Message-State: AOAM530GALkNLWMhQEgTbrIfB98nyceL6yyQVUWRei1XwRRADuGJ6WK8
        I6nUqmOG7Ubuzamc53atkN/uK3W/onZolQ==
X-Google-Smtp-Source: ABdhPJxdAvtpA0b+0QMymcnMlaWAoDfamf8vkww1ga54r7T1M00JSMkdV+RgVloVeZ+JQW6SuUkyMA==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr7312653wrt.129.1622192796118;
        Fri, 28 May 2021 02:06:36 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:35 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jogo@openwrt.org>, linux-leds@vger.kernel.org
Subject: [PATCH 04/15] leds: leds-bcm6328: Demote kernel-doc abuse
Date:   Fri, 28 May 2021 10:06:18 +0100
Message-Id: <20210528090629.1800173-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528090629.1800173-1-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/leds/leds-bcm6328.c:97: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Pavel Machek <pavel@ucw.cz>
Cc: "Fernández Rojas" <noltari@gmail.com>
Cc: Jonas Gorski <jogo@openwrt.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/leds/leds-bcm6328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 226d17d253ed3..2d4d87957a300 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -93,7 +93,7 @@ static unsigned long bcm6328_led_read(void __iomem *reg)
 #endif
 }
 
-/**
+/*
  * LEDMode 64 bits / 24 LEDs
  * bits [31:0] -> LEDs 8-23
  * bits [47:32] -> LEDs 0-7
-- 
2.31.1

