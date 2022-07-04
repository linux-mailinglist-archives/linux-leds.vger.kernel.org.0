Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E8E5652F1
	for <lists+linux-leds@lfdr.de>; Mon,  4 Jul 2022 13:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbiGDLAY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Jul 2022 07:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbiGDLAL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jul 2022 07:00:11 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A27101F7
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 04:00:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 4FC33CE13FD
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 11:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEDEC341CA;
        Mon,  4 Jul 2022 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656932404;
        bh=EBkJrcsjHYCBBn3j6EJnVWLe66NOK950ezeAFNOSqOQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uw8N91DBmwlgRVBjOBMIBicnjdx9iatHSlSWJOX6ZbmTAUh+UdZtqXFwy2TuYT925
         LzwkQ1WfUsBF23bceRZOb6/dzbv7xK+npS3ysw88AESPA7o2uw4MXLukFE1xZPuW6k
         5/UjwQpRyvWl4LzZyrtu96aPuJ0vhDvstAihz09iSyC3RvxmGBkEdrB138S3A9+mF/
         2H6jNklIQH/z2KZwY+C4+3rdtLsba+BZ6KbnwrQ5edmM6LetRZcQ1NC/1UkRajlG+R
         QikL3UBSL7MOa7cOtXugCeo3gLpC1MybmcP0l53aE0yzOgM6u6DKdjvBKpON/cKf8R
         f2PffYQ7J1LCg==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     pali@kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 3/3] leds: turris-omnia: change max brightness from 255 to 1
Date:   Mon,  4 Jul 2022 12:59:55 +0200
Message-Id: <20220704105955.15474-4-kabel@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704105955.15474-1-kabel@kernel.org>
References: <20220704105955.15474-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Using binary brightness makes more sense for this controller, because
internally in the MCU it works that way: the LED has a color, and a
state whether it is ON or OFF.

The resulting brightness computation with led_mc_calc_color_components()
will now always result in either (0, 0, 0) or the multi_intensity value.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index fae155bd119c..f53bdc3f4cea 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -146,7 +146,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	init_data.fwnode = &np->fwnode;
 
 	cdev = &led->mc_cdev.led_cdev;
-	cdev->max_brightness = 255;
+	cdev->max_brightness = 1;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
 	cdev->trigger_type = &omnia_hw_trigger_type;
 	cdev->default_trigger = omnia_hw_trigger.name;
-- 
2.35.1

