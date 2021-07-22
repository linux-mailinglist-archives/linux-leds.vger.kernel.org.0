Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBC03D2D7C
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jul 2021 22:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhGVTfs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Jul 2021 15:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhGVTfs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Jul 2021 15:35:48 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD84CC061575
        for <linux-leds@vger.kernel.org>; Thu, 22 Jul 2021 13:16:21 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id o3-20020a05600c5103b029024c0f9e1a5fso2000003wms.4
        for <linux-leds@vger.kernel.org>; Thu, 22 Jul 2021 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=oZxbDaL+1Q05JtVdj9k7Hi6WhPkT39YJUB+Ls+m1W/w=;
        b=jRiQj+2oTUvoxErSXpfYDhpv02ee9Cg5HrgJuTMBhlSL0H+gwIl7h0AmtDYgKC50IM
         CoPssn8DoGSMU+Oi/39NLkqegJE4udp7YMAHBU1JcpAj0YQ+EykCJTcCcvyzxmRwz2Ly
         DkVcHn2CPwfgkzWBc6fbrw3T9FaiNxGNSWVfyBAF0gOwGYp/vKzYmXTI03r6CPmVLJkY
         aD4y6Mtu8bmg2XjQggcMifGSxiTvLO0XiJZ9WsU9h/T9n8O5VSfnlNQ1rWUURRjWeg48
         HFQCpmWlyjyYDsfDw3GnkrUvl5Ebl5hsJNG7VHoVq5MME2ccKs4ddIYYW5UvS/Ffw6y3
         PDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=oZxbDaL+1Q05JtVdj9k7Hi6WhPkT39YJUB+Ls+m1W/w=;
        b=VVsA20oarYsHRLtDSj6pC38ToeHHVU4RdMPKBNMcyOWVXNvjmgtnBLKfyka1dug5AP
         +JGFw2QWgnlaV3czSln0TFU6UK648mUZShxmIPkF5Y/3GjD5MehDPbliLi58NM7+j0Tg
         UJbbfP8CpVhzHv6+Z7Aoe/8Jno4n8/RKtVhqLY5ElRm82lCNs3e5xCp8xr2xNbl0WvHg
         pHUXJIZztPxLsEa9SscpXXfeoG6ztVGHLHu2HhTeOd/w49ohswRWRvjcKMKfvn1VyhBX
         53mUFwTbj3w+ZQ4TRfJfMRHp3e1mg8AxnrrgzRiYm/UXRpLhekP5tKBYbG2i6c9UyS55
         xMHA==
X-Gm-Message-State: AOAM531zAwU6Mxm+kc7L13Xf5IHujEu9Ae/+3RTMmLa22E8HEHQfWb2p
        pODwHmX3LFX/Ode1OOCHxjlQciolkuY=
X-Google-Smtp-Source: ABdhPJxSAKejoTYcn1k0LcvaQN2bKRi7vP1nwNdJ6Ti91+f2TDxwWNSB3yWM66H8WFRgOMU3vKy5Ew==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id g9mr1235674wmq.54.1626984980210;
        Thu, 22 Jul 2021 13:16:20 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3f:3d00:5025:6a08:c954:44d4? (p200300ea8f3f3d0050256a08c95444d4.dip0.t-ipconnect.de. [2003:ea:8f3f:3d00:5025:6a08:c954:44d4])
        by smtp.googlemail.com with ESMTPSA id v30sm33348674wrv.85.2021.07.22.13.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 13:16:19 -0700 (PDT)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: triggers: Improve handling of LEDs supporting hw
 triggers only
Message-ID: <cfacb5b8-e7bf-c7c8-c5ab-4a8048a67db2@gmail.com>
Date:   Thu, 22 Jul 2021 22:16:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

A LED supporting HW triggers only (example: network PHY LED indicating
100M link or 1000M link or ..) may have none of the software LED
control callbacks implemented. As of today the software LED control
triggers would be available nevertheless. This doesn't make sense.
If a LED supports HW triggers only, offer only the matching HW triggers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 4e7b78a84..48924bad2 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -27,10 +27,23 @@ LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
-static inline bool
-trigger_relevant(struct led_classdev *led_cdev, struct led_trigger *trig)
+static bool led_hw_trig_only(struct led_classdev *led_cdev)
 {
-	return !trig->trigger_type || trig->trigger_type == led_cdev->trigger_type;
+	return !led_cdev->brightness_set && !led_cdev->brightness_set_blocking &&
+	       !led_cdev->blink_set && !led_cdev->pattern_set;
+}
+
+static bool trigger_relevant(struct led_classdev *led_cdev,
+			     struct led_trigger *trig)
+{
+	if (trig->trigger_type == led_cdev->trigger_type)
+		return true;
+
+	/* LED supports matching hw triggers only */
+	if (led_hw_trig_only(led_cdev))
+		return false;
+
+	return !trig->trigger_type;
 }
 
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
-- 
2.32.0

