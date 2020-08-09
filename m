Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA9B23FF43
	for <lists+linux-leds@lfdr.de>; Sun,  9 Aug 2020 18:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgHIQcf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Aug 2020 12:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39435 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbgHIQce (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Aug 2020 12:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596990751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=PsMQY7jSXY4+oAbixnAnftAfol98FgMKGuspJ+Q9XFk=;
        b=gn5d3KbxZXnqPmkMLQZMVQUIdxIgETEUjnhMVaJL6HhkY1uhUY5UK4FHJ8/dM9D0bgxAIE
        NfSG2es6+0tyGOWp7dWeiTBXyg/1yWRBOEqAwcyrDU8m2oOyiN8m5q8MwyolE/r6Iwl3in
        VAbIr3fY0aDvHsp4WOtek6NPqeh6uUU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-h36S9TT_MmGEm8-DjBC4Zw-1; Sun, 09 Aug 2020 12:32:27 -0400
X-MC-Unique: h36S9TT_MmGEm8-DjBC4Zw-1
Received: by mail-qv1-f71.google.com with SMTP id j8so5689937qvu.3
        for <linux-leds@vger.kernel.org>; Sun, 09 Aug 2020 09:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PsMQY7jSXY4+oAbixnAnftAfol98FgMKGuspJ+Q9XFk=;
        b=D+FT1MsIGDxbaDEwuWDRl+Xaq0x0mFrFvz4N5qrTm4XPtyBz1PjAgQV8gNISaWiqnL
         /5ViyoWptjOqcfzyy6hKwb06DMPsVxOi9Y4IuVG3Zsrvh3j065zlPqA0obTudHzgpHSD
         b0Uehv8d4+QZX7uuyFIxokBAoM2K26uajHAQDCr7v9Pd8T/MGaWNgfZSqejqk8ny0XIs
         OCYFKBfxZEw9VIi38T1kPH9VXZo8Ai4tRcQjYVZ1KqwIAJ1l+Rx7Qf2zEsfA1jjTSETR
         o0Yz+ItNTZiWSCwasxLqgcewRN1wElfBoxwcJN1vhY0p1XwLwLamdpZZWe0sK5kW8xtr
         yUig==
X-Gm-Message-State: AOAM531i8r3UkvKx3LsUS8nYI0RWuCjWhnJtBTk/bWdeWaTvDhRG6cYy
        gjmNS7x98hChiZbTvVZ5tw8vaTFnJiuvXyc+IaXilQvKKtZWzZjBwJo459SDcitKxoQFkncIVpY
        Xxn6kooDyVqP/aMV6TOPIJw==
X-Received: by 2002:a05:6214:290:: with SMTP id l16mr24599891qvv.187.1596990747394;
        Sun, 09 Aug 2020 09:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxma2GBDDu2oNvsxHZ9yvLuxWvPbRyHyBBHUXJQyxP4tzEslX0cuIqMV03P+K7mAvDDQKZmWw==
X-Received: by 2002:a05:6214:290:: with SMTP id l16mr24599873qvv.187.1596990747159;
        Sun, 09 Aug 2020 09:32:27 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id y3sm8304604qkd.132.2020.08.09.09.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 09:32:26 -0700 (PDT)
From:   trix@redhat.com
To:     sean.wang@mediatek.com, pavel@ucw.cz, dmurphy@ti.com,
        matthias.bgg@gmail.com, jacek.anaszewski@gmail.com
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] leds: mt6323: move period calculation
Date:   Sun,  9 Aug 2020 09:32:21 -0700
Message-Id: <20200809163221.32413-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem

leds-mt6323.c:275:12: warning: Division by zero
        duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is because period can be 0.

	period = *delay_on + *delay_off;

There is a later check that *delay_on/off are valid.

	if (!*delay_on && !*delay_off) {
		*delay_on = 500;
		*delay_off = 500;
	}

Setting the delay_on/off means period needs to be recalculated
anyway.  So move the period statements after this check.

Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/leds/leds-mt6323.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 2a13e3161bf4..7b240771e45b 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -248,15 +248,6 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 	u8 duty_hw;
 	int ret;
 
-	/*
-	 * Units are in ms, if over the hardware able
-	 * to support, fallback into software blink
-	 */
-	period = *delay_on + *delay_off;
-
-	if (period > MT6323_MAX_PERIOD)
-		return -EINVAL;
-
 	/*
 	 * LED subsystem requires a default user
 	 * friendly blink pattern for the LED so using
@@ -268,6 +259,15 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 		*delay_off = 500;
 	}
 
+	/*
+	 * Units are in ms, if over the hardware able
+	 * to support, fallback into software blink
+	 */
+	period = *delay_on + *delay_off;
+
+	if (period > MT6323_MAX_PERIOD)
+		return -EINVAL;
+
 	/*
 	 * Calculate duty_hw based on the percentage of period during
 	 * which the led is ON.
-- 
2.18.1

