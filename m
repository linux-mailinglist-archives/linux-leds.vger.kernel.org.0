Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC597A4F63
	for <lists+linux-leds@lfdr.de>; Mon, 18 Sep 2023 18:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjIRQlb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Sep 2023 12:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjIRQlA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Sep 2023 12:41:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713AA30C3
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 09:37:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8341C3277B;
        Mon, 18 Sep 2023 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695046049;
        bh=sIT9k1TK/Df2T/mR4SCR2OKfZ0n5lS5Q9qwaQdUZ+NU=;
        h=From:To:Cc:Subject:Date:From;
        b=nX15XlwZh/VvT/QyzTlaZz/f8egJCWLh7rm6e4nRCj63iOmqzvJxditVgHGGcC1Lt
         DuGFhrd+L9JQvezQzdDfCq5YJxH/Ui47/YI3j0jQionnOV0OcP4fd0o5AjKxLnb1rJ
         t4wnv6wStx5Vh34R7ewwO6n5iw22QEssFGs+Nysq6KEzG+VICiyvmd+dwxyIZYDrkO
         +RtUscwb0tdcCzl2PkNSA0D7vKrA8LRPs5/jal1AB4Iwc1sjnW9hPsaCzMmzLSX4pv
         LJbP25QjI7MMp2eTLF2VB7HW0HOM1ud+giSB2OwQ0nm+8sJCAccW8btoDQ1vwZIm3M
         Nrzl2xTbxiZNg==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Da Xue <da@libre.computer>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
Date:   Mon, 18 Sep 2023 16:07:24 +0200
Message-ID: <20230918140724.18634-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commit c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that
is always false") fixed a no-op BUG_ON. This turned out to cause a
regression, since some in-tree device-tree files already use
LED_COLOR_ID_MULTI.

Drop the BUG_ON altogether.

Fixes: c3f853184bed ("leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false")
Reported-by: Da Xue <da@libre.computer>
Closes: https://lore.kernel.org/linux-leds/ZQLelWcNjjp2xndY@duo.ucw.cz/T/
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/led-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 04f9ea675f2c..214ed81eb0e9 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -479,10 +479,6 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 
 	led_parse_fwnode_props(dev, fwnode, &props);
 
-	/* We want to label LEDs that can produce full range of colors
-	 * as RGB, not multicolor */
-	BUG_ON(props.color == LED_COLOR_ID_MULTI);
-
 	if (props.label) {
 		/*
 		 * If init_data.devicename is NULL, then it indicates that
-- 
2.41.0

