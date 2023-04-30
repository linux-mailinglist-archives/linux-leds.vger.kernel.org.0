Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1B46F2A8D
	for <lists+linux-leds@lfdr.de>; Sun, 30 Apr 2023 22:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjD3UBo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Apr 2023 16:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbjD3UBg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2023 16:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFCEE4E
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2023 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682884811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ccPhiSeQxMca4c8tEuubKQRV3y9ln8JSCpI2EtQe6gI=;
        b=aqgkGmcK9n/L6NKQg+QBQEAQw9WBDQLTrmDVxMItDCUsP+PSk07zQmoxxuMCKwNJ0j1vM3
        FfRWPPPyzcRVTZoR8u2/Jq9/f4JOhptuoFMTnIlhf6Rq7QfVLdfOh/DJpizn5gWJxd4BOF
        KRJMVcc46BIyHRPckeTM7Gw5OwcIxrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-MzT_7wgdNYCCTzjDJ2jBlA-1; Sun, 30 Apr 2023 16:00:07 -0400
X-MC-Unique: MzT_7wgdNYCCTzjDJ2jBlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 566E9185A790;
        Sun, 30 Apr 2023 20:00:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 737EDC15BA0;
        Sun, 30 Apr 2023 20:00:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: [PATCH v3 5/5] leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
Date:   Sun, 30 Apr 2023 21:59:52 +0200
Message-Id: <20230430195952.862527-6-hdegoede@redhat.com>
In-Reply-To: <20230430195952.862527-1-hdegoede@redhat.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The desired default behavior of LED1 / the charge LED is breathing
while charging and on/solid when full. Since triggers cannot select
breathing, blink_set() gets called when charging. Use breathing
when the default "charging-blink-full-solid" trigger is used to
achieve the desired default behavior.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Also set on/off delay to 1000 so that we get a slow breathing effect,
  this counter-acts the v2 cht_wc_leds_set_effect() change changing
  the default delays from 1000 to 500
---
 drivers/leds/leds-cht-wcove.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index ee9fb4bee018..0cfebee98910 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -270,7 +270,21 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
 				 unsigned long *delay_on,
 				 unsigned long *delay_off)
 {
-	return cht_wc_leds_set_effect(cdev, delay_on, delay_off, CHT_WC_LED_EFF_BLINKING);
+	u8 effect = CHT_WC_LED_EFF_BLINKING;
+
+	/*
+	 * The desired default behavior of LED1 / the charge LED is breathing
+	 * while charging and on/solid when full. Since triggers cannot select
+	 * breathing, blink_set() gets called when charging. Use slow breathing
+	 * when the default "charging-blink-full-solid" trigger is used to
+	 * achieve the desired default behavior.
+	 */
+	if (cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
+		*delay_on = *delay_off = 1000;
+		effect = CHT_WC_LED_EFF_BREATHING;
+	}
+
+	return cht_wc_leds_set_effect(cdev, delay_on, delay_off, effect);
 }
 
 static int cht_wc_leds_pattern_set(struct led_classdev *cdev,
-- 
2.39.2

