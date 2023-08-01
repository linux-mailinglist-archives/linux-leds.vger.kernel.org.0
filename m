Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE63276B50A
	for <lists+linux-leds@lfdr.de>; Tue,  1 Aug 2023 14:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbjHAMti (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Aug 2023 08:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbjHAMti (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Aug 2023 08:49:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A18DE6
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 05:49:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC48F6158F
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 12:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02817C433C7;
        Tue,  1 Aug 2023 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690894176;
        bh=l5zgW34TeKaOMLTdsybU9+eKvfYnaA6X9dVN/rjINy4=;
        h=From:To:Cc:Subject:Date:From;
        b=hMhl0IGALsBspFe4VruESqnSfmFMna5MKmUBO/tLAvxR7XTp2uSvnWpVWate4vPhK
         sqP+v+JNBj3RZfvW/2+9H08fLk3UEvR0mFq+GpygHbNTH1QTLouT3BMFsTmJJNWNjc
         cfhp6wLzHtROISEpaJTqj9Kr/wHMzf3uVG0mlss2GdsZqvl+iFmwLovF+EtWc+c1DC
         aAe/watOaTQuEk3SIYzL4HAX5/uuscdGJ7jbHQrlmxWdZN0wv7RJzy7E3NjLocTokz
         8C9Jeot2jmOJUo2hZcoUm3YIGfYPVV4zzTRzFelnyjiPrquqFoFDnRQ7xoOJNlCERu
         V3szf26AsZliw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] leds: multicolor: Use rounded division when calculating color components
Date:   Tue,  1 Aug 2023 14:49:31 +0200
Message-ID: <20230801124931.8661-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Given channel intensity, LED brightness and max LED brightness, the
multicolor LED framework helper led_mc_calc_color_components() computes
the color channel brightness as

    chan_brightness = brightness * chan_intensity / max_brightness

Consider the situation when (brightness, intensity, max_brightness) is
for example (16, 15, 255), then chan_brightness is computed to 0
although the fractional divison would give 0.94, which should be rounded
to 1.

Use DIV_ROUND_CLOSEST here for the division to give more realistic
component computation:

    chan_brightness = DIV_ROUND_CLOSEST(brightness * chan_intensity,
                                        max_brightness)

Fixes: 55d5d3b46b08 ("leds: multicolor: Introduce a multicolor class definition")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/led-class-multicolor.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index e317408583df..ec62a4811613 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/led-class-multicolor.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -19,9 +20,10 @@ int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 	int i;
 
 	for (i = 0; i < mcled_cdev->num_colors; i++)
-		mcled_cdev->subled_info[i].brightness = brightness *
-					mcled_cdev->subled_info[i].intensity /
-					led_cdev->max_brightness;
+		mcled_cdev->subled_info[i].brightness =
+			DIV_ROUND_CLOSEST(brightness *
+					  mcled_cdev->subled_info[i].intensity,
+					  led_cdev->max_brightness);
 
 	return 0;
 }
-- 
2.41.0

