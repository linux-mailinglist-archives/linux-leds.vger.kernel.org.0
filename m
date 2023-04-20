Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D6C6E94A9
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 14:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjDTMii (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 08:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjDTMih (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 08:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C59744AE
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681994270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gS0ri820pHKesZRuFfP8A5v4sig3TAvuzch+UcaH6hY=;
        b=KIS+mJKJEw+30E1bjstrHTd4h9dZTBEP6ysFZLuDApQ28wdfJmbu2P7myF7iZ7Kpky8REA
        uwQu5GXZ6HXJ6g0UL0zjgj9UriDsXwfeJUGBG1yqfCwdTYHa/otiO/2LG/jVG111hc0GBU
        chsMNNzAEwNH5wpBycFEn1C4CF45g6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-ul3RrgThNQyojtiV3MxtCQ-1; Thu, 20 Apr 2023 08:37:48 -0400
X-MC-Unique: ul3RrgThNQyojtiV3MxtCQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E837185A78B;
        Thu, 20 Apr 2023 12:37:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.216])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 64959492C3E;
        Thu, 20 Apr 2023 12:37:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH v2 5/5] leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
Date:   Thu, 20 Apr 2023 14:37:41 +0200
Message-Id: <20230420123741.57160-6-hdegoede@redhat.com>
In-Reply-To: <20230420123741.57160-1-hdegoede@redhat.com>
References: <20230420123741.57160-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 drivers/leds/leds-cht-wcove.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 7c395220251f..9adc7977415d 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -271,7 +271,19 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
 				 unsigned long *delay_on,
 				 unsigned long *delay_off)
 {
-	return cht_wc_leds_set_effect(cdev, delay_on, delay_off, CHT_WC_LED_EFF_BLINKING);
+	u8 effect = CHT_WC_LED_EFF_BLINKING;
+
+	/*
+	 * The desired default behavior of LED1 / the charge LED is breathing
+	 * while charging and on/solid when full. Since triggers cannot select
+	 * breathing, blink_set() gets called when charging. Use breathing
+	 * when the default "charging-blink-full-solid" trigger is used to
+	 * achieve the desired default behavior.
+	 */
+	if (cdev->flags & LED_INIT_DEFAULT_TRIGGER)
+		effect = CHT_WC_LED_EFF_BREATHING;
+
+	return cht_wc_leds_set_effect(cdev, delay_on, delay_off, effect);
 }
 
 static int cht_wc_leds_pattern_set(struct led_classdev *cdev,
-- 
2.39.2

