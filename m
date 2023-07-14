Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC95E7535BD
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 10:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbjGNIxN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 04:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbjGNIxC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 04:53:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9868B198A
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 01:53:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2DB8A61CA0
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 08:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F476C433CA;
        Fri, 14 Jul 2023 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689324780;
        bh=hfhVlSbfqvPK76cxdTnugo9OdIJZfmc1WJ2D+X21X2w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TjyaopTzTB12udXKp+kCYT8I32qafqg7o69HUc5sxhomVBeMvcTx64wfxO9ua2VLf
         gFb8r7cWWYLyol+iHdi7HnSAX+22DGmRJXntlEaTfIQSTQrGbW4e39MsG4GbotaJ38
         2wW87qhqefBuYuteYW5L+UgWSRgoAxF3vtf8EqOF3M9aRLQz7boAk0LOA3iubWlnJL
         a+VBvVGFLkGlniqUEZUa9TqAKjnTgkaa9RxqDgSmRL8YmLxv3t/Z2oRtJT5JHPL4eS
         Dug32kBmLkvvekncXnRPgqDOBuAKV6KiA8UEbTZAVwadqBfVXL+S5X+F2aVEMmtaRQ
         u9dqHYS2OvZnw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 2/3] leds: turris-omnia: initialize multi-intensity to full
Date:   Fri, 14 Jul 2023 10:52:52 +0200
Message-ID: <20230714085253.13544-3-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714085253.13544-1-kabel@kernel.org>
References: <20230714085253.13544-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The default color of each LED before driver probe is (255, 255, 255).
Initialize multi_intensity to this value, so that it corresponds to the
reality.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index c063b6b710f9..7977c0372667 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -98,10 +98,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	led->subled_info[0].color_index = LED_COLOR_ID_RED;
+	led->subled_info[0].intensity = 255;
 	led->subled_info[0].channel = 0;
 	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	led->subled_info[1].intensity = 255;
 	led->subled_info[1].channel = 1;
 	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+	led->subled_info[2].intensity = 255;
 	led->subled_info[2].channel = 2;
 
 	led->mc_cdev.subled_info = led->subled_info;
-- 
2.41.0

