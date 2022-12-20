Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D726651BBD
	for <lists+linux-leds@lfdr.de>; Tue, 20 Dec 2022 08:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbiLTHeH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Dec 2022 02:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiLTHeH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Dec 2022 02:34:07 -0500
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8EE259
        for <linux-leds@vger.kernel.org>; Mon, 19 Dec 2022 23:34:02 -0800 (PST)
Received: from localhost.localdomain (unknown [123.112.69.65])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9451243595;
        Tue, 20 Dec 2022 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1671521640;
        bh=ZCu3sQiTIubpBdHzgGzylQkrfu1yEGXniS2u6M6H1A4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Sw45q8pUlBYzDQnZIrIld4SIpNBQVbUKdCN4gHh6L388uj/DMPgefqJP9P7PWB9Qr
         NePqOOFcSR4X0cTxCvb+agQYd0jLbIuymi7+EPRMj7yCQQTaBR7kdtMZZBCpaRQl5G
         X2uy7w1mU7Ilfe2eptgrbuGUfaG9MG9A5dg9CXpZgNpo7u5DIwr4nznUikdjN74ft3
         Ho99sIAnEAHR0Y3/3/vplXmJZSZGaXc1aY/aA6PkcT2ei57Trb3bU1r1dyay+7fVtw
         zG5+hvhUTsCQKahD4kuPI9xVy4edyST21sea92l/HoQVlu1WxjJGu7D2w6Yv9oRQsP
         rB7sKjzXjrhLA==
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-leds@vger.kernel.org, pavel@ucw.cz
Cc:     hui.wang@canonical.com
Subject: [PATCH] leds: pwm: clear the led structure before parsing each child node
Date:   Tue, 20 Dec 2022 15:33:35 +0800
Message-Id: <20221220073335.393489-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I defined 2 leds in the device tree, in the 1st led node, the
max-brightness is set to 248, while in the 2nd led node, I
mis-spelled the max-brightness to max-brighttness, but the driver
is still able to get the max-brightness 248 for the 2nd node,  that
is because the led structure is not cleared before parsing each child
node.

	pwmleds {
		compatible = "pwm-leds";

		pwm-green {
			...
			max-brightness = <248>;
		};

		pwm-red {
		        ...
			max-brighttness = <128>;
		};

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/leds/leds-pwm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 6832180c1c54..29194cc382af 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -138,9 +138,9 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 	struct led_pwm led;
 	int ret;
 
-	memset(&led, 0, sizeof(led));
-
 	device_for_each_child_node(dev, fwnode) {
+		memset(&led, 0, sizeof(led));
+
 		ret = fwnode_property_read_string(fwnode, "label", &led.name);
 		if (ret && is_of_node(fwnode))
 			led.name = to_of_node(fwnode)->name;
-- 
2.34.1

