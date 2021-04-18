Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3D43637E3
	for <lists+linux-leds@lfdr.de>; Sun, 18 Apr 2021 23:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhDRVoa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Apr 2021 17:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhDRVo3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Apr 2021 17:44:29 -0400
X-Greylist: delayed 555 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 18 Apr 2021 14:44:00 PDT
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDB5C06174A
        for <linux-leds@vger.kernel.org>; Sun, 18 Apr 2021 14:44:00 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A2D4D1F542;
        Sun, 18 Apr 2021 23:34:37 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     linux-leds@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: ledtrig-pattern: Use last_repeat when applying hw pattern
Date:   Sun, 18 Apr 2021 23:34:26 +0200
Message-Id: <20210418213427.220638-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

`last_repeat` holds the actual value requested by the user whereas
`repeat` is a software iteration variable that is unused in hardware
patterns.

Furthermore `last_repeat` is the field returned to the user when reading
the `repeat` sysfs property.  This field is initialized to `-1` which is
- together with `1` - the only valid value in the upcoming Qualcomm LPG
driver.  It is thus unexpected when `repeat` with an initialization
value of `0` is passed into the the driver, when the sysfs property
clearly presents a value of `-1`.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/leds/trigger/ledtrig-pattern.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 4d138d5317e9..2853b75df338 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -126,7 +126,8 @@ static int pattern_trig_start_pattern(struct led_classdev *led_cdev)
 
 	if (data->is_hw_pattern) {
 		return led_cdev->pattern_set(led_cdev, data->patterns,
-					     data->npatterns, data->repeat);
+					     data->npatterns,
+					     data->last_repeat);
 	}
 
 	/* At least 2 tuples for software pattern. */
-- 
2.31.1

