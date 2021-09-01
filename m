Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565263FE584
	for <lists+linux-leds@lfdr.de>; Thu,  2 Sep 2021 00:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhIAWbv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Sep 2021 18:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhIAWbs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Sep 2021 18:31:48 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376E1C061757
        for <linux-leds@vger.kernel.org>; Wed,  1 Sep 2021 15:30:51 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id v123so60647pfb.11
        for <linux-leds@vger.kernel.org>; Wed, 01 Sep 2021 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYb5M9vJD6g2TbFXtZN4D2J6U1KnQQ1efHREju0B1vw=;
        b=oFTeaJRFgO/ouVhyqmc/+MwchhDHIS7rmnoS03XFg4j0rX/+dIJOyhTJ7KW9HBW38Y
         Zbp5IckwR7dFYYNCXktDEEVRzXWaClkWgetvHeSgrX9WCUUhD431MKstvfujwGaEExIe
         58q5lEGbh9T6G/+WFDNuSLlzILljp7JYklH+EUClF21mTAy2yPedHiE3gFQMA86q3Pw1
         uGoZBw5sXn9WVp/ahGOhXk4aVciPSEQXBGQiGbwqboDvhdVZX60ItDdssGls9Oh1dSe1
         R2rVthxmaPJHVDpYqL0d5c5Ra/Sz85PVDwmEqEi6cKnGISz9EOOdt6jB+i1Zl1IJ9w+2
         8paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYb5M9vJD6g2TbFXtZN4D2J6U1KnQQ1efHREju0B1vw=;
        b=eQWX9TN6cfdML9brc5g+P+pa6jrgnLDwerwTBXLe7rV6bicr+0I3xb2zAmKCBqvmhx
         qr/bqpZPbpVCdx7njDEsLq5zXQWEF1FkEx0aAVT6A4iNxptxJ5gAhP60Ka4kXYMw/36v
         w7bPUVvjKBD0jMSqkp3dnAjI5naGX7zpSsfFrGYym++9aY2v3qjF42hp4MABjgwbmUxf
         AiNg12ZMnlqcNS33XAtmmJMsrASzECCRJ2WmzDvjc38GHoDnx74Cq36UOQg73a9JGZ6b
         3wjGIeVnb5u66jAAlDS1oODSZQ3HwENf4WZbUYZBQ2QDbihJ+CJ/mvpmzFZLh3zEy1WG
         Y8sQ==
X-Gm-Message-State: AOAM532mpLzJmAfznMcW66Q6hzyYqYGZqAvocROLuFUS3CTaFuOyMSJi
        PUhx8OALFfidRN572+8zn9oohZ1SMSkcofeNzZHs7aEp
X-Google-Smtp-Source: ABdhPJz4NFrpUfWgShVRTojWTG+UnB+4snJX9oLQ3QWt60bQnMXgrG72hBWvkjMTQQM39qNy7wM0qA==
X-Received: by 2002:a62:ee0f:0:b029:335:a681:34f6 with SMTP id e15-20020a62ee0f0000b0290335a68134f6mr157519pfi.55.1630535450654;
        Wed, 01 Sep 2021 15:30:50 -0700 (PDT)
Received: from localhost.localdomain (rrcs-24-43-218-40.west.biz.rr.com. [24.43.218.40])
        by smtp.gmail.com with ESMTPSA id j2sm9623pfe.201.2021.09.01.15.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 15:30:50 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for game controllers.
Date:   Wed,  1 Sep 2021 15:30:36 -0700
Message-Id: <20210901223037.2964665-3-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Player LEDs are commonly found on game controllers from Nintendo and Sony
to indicate a player ID across a number of LEDs. For example, "Player 2"
might be indicated as "-x--" on a device with 4 LEDs where "x" means on.

This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
player LEDs from the kernel. Until now there was no good standard, which
resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.

Note: management of Player IDs is left to user space, though a kernel
driver may pick a default value.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
 include/dt-bindings/leds/common.h      |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
index 4a8b9dc4bf52..2160382c86be 100644
--- a/Documentation/leds/well-known-leds.txt
+++ b/Documentation/leds/well-known-leds.txt
@@ -16,6 +16,20 @@ but then try the legacy ones, too.
 
 Notice there's a list of functions in include/dt-bindings/leds/common.h .
 
+* Gamepads and joysticks
+
+Game controllers may feature LEDs to indicate a player number. This is commonly
+used on game consoles in which multiple controllers can be connected to a system.
+The "player LEDs" are then programmed with a pattern to indicate a particular
+player. For example, a game controller with 4 LEDs, may be programmed with "x---"
+to indicate player 1, "-x--" to indicate player 2 etcetera where "x" means on.
+Input drivers can utilize the LED class to expose the individual player LEDs
+of a game controller using the function "player".
+Note: tracking and management of Player IDs is the responsibility of user space,
+though drivers may pick a default value.
+
+Good: "input*:*:player-{1,2,3,4,5}
+
 * Keyboards
   
 Good: "input*:*:capslock"
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d44ba2..94999c250e4d 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -60,6 +60,9 @@
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"
 
+/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
+#define LED_FUNCTION_PLAYER "player"
+
 /* Miscelleaus functions. Use functions above if you can. */
 #define LED_FUNCTION_ACTIVITY "activity"
 #define LED_FUNCTION_ALARM "alarm"
-- 
2.31.1

