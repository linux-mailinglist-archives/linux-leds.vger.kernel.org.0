Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E1D6C502F
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjCVQKM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjCVQJ7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:09:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB54A136FB;
        Wed, 22 Mar 2023 09:09:56 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E99018CE;
        Wed, 22 Mar 2023 17:09:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501385;
        bh=JjQ9fwbnmnE9m2wYDgra5491TAmNPrzPruanD8GkQR4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VhxqCraFyggvPesvHrQoEG8SUW3beWallumTpHpdH4pls6Sz1RGB3ukETNIiu7XCc
         5/zjdQ2BXKAQx/ga3rjm5MYX3qucEV540f1761yL5DEoh9rUXFPT5ztbrmuyUzQ3iH
         YwCilMc82frbVwrsHVKURoneGIreesGcAXzb4XeQ=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 5/8] leds: tps68470: Refactor tps68470_brightness_get()
Date:   Wed, 22 Mar 2023 16:09:23 +0000
Message-Id: <20230322160926.948687-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322160926.948687-1-dan.scally@ideasonboard.com>
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We want to extend tps68470_brightness_get() to be usable with the
other LEDs supplied by the IC; refactor it to make that easier.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/leds/leds-tps68470.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
index d2060fe4259d..44df175d25de 100644
--- a/drivers/leds/leds-tps68470.c
+++ b/drivers/leds/leds-tps68470.c
@@ -77,23 +77,24 @@ static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev
 	int ret = 0;
 	int value = 0;
 
-	ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
-	if (ret)
-		return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading register\n");
-
 	switch (led->led_id) {
 	case TPS68470_ILED_A:
-		value = value & TPS68470_ILEDCTL_ENA;
-		break;
 	case TPS68470_ILED_B:
-		value = value & TPS68470_ILEDCTL_ENB;
+		ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
+		if (ret)
+			return dev_err_probe(led_cdev->dev, ret,
+					     "failed to read LED status\n");
+
+		value &= led->led_id == TPS68470_ILED_A ? TPS68470_ILEDCTL_ENA :
+					TPS68470_ILEDCTL_ENB;
 		break;
+	default:
+		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
 	}
 
 	return value ? LED_ON : LED_OFF;
 }
 
-
 static int tps68470_ledb_current_init(struct platform_device *pdev,
 				      struct tps68470_device *tps68470)
 {
-- 
2.34.1

