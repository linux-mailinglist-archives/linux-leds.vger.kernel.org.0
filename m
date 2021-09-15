Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842AA40C17B
	for <lists+linux-leds@lfdr.de>; Wed, 15 Sep 2021 10:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbhIOIPU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Sep 2021 04:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232993AbhIOIPT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Sep 2021 04:15:19 -0400
X-Greylist: delayed 651 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Sep 2021 01:14:00 PDT
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE9DC061575
        for <linux-leds@vger.kernel.org>; Wed, 15 Sep 2021 01:14:00 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 20508200E8;
        Wed, 15 Sep 2021 10:03:01 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] leds: ledtrig-pattern: Use last_repeat when applying hw pattern
Date:   Wed, 15 Sep 2021 10:02:52 +0200
Message-Id: <20210915080252.69147-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

`last_repeat` holds the actual value requested by the user whereas
`repeat` is a software iteration variable that is unused in hardware
patterns.

Furthermore `last_repeat` is the field returned to the user when reading
the `repeat` sysfs property.  This field is initialized to `-1` which
is (together with `1`) the only valid value in the upcoming Qualcomm LPG
driver.  It is thus unexpected when `repeat` with an initialization
value of `0` is passed into the the driver, when the sysfs property
clearly presents a value of `-1`.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Resending to pick up Bjorn's s-o-b/r-b and address Pavel in the To:
field directly.

 drivers/leds/trigger/ledtrig-pattern.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 43a265dc4696..a11d68143757 100644
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
2.33.0

