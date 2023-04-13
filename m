Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3636E10D9
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 17:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbjDMPTG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 11:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjDMPTF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 11:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649C79755
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681399101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4cEBUnbg1vE7QsUZJZ/ROdFhuT0hQY8iLC6B/T3ZzLk=;
        b=Kuc3TyP+RPqaYnE+fqppnPuOuN+8HztxrODQZrxXzl7inKFcBM5VPJIyyLx2nmYHvw57fX
        WURNEIIgYifnShyd6FnIpYhedrS/zr1vJz5B/s/4u53UInvO8QKOA5WVmwAE3p3A46zdVs
        Tu2IU4R9zVQj6qahmZ4uClmtGGAzMUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-dzd7R9brOrCYpIEzyIjIyw-1; Thu, 13 Apr 2023 11:18:19 -0400
X-MC-Unique: dzd7R9brOrCYpIEzyIjIyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02438885626;
        Thu, 13 Apr 2023 15:18:19 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.251])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D734F141511D;
        Thu, 13 Apr 2023 15:18:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH 5/5] leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
Date:   Thu, 13 Apr 2023 17:18:08 +0200
Message-Id: <20230413151808.20900-6-hdegoede@redhat.com>
In-Reply-To: <20230413151808.20900-1-hdegoede@redhat.com>
References: <20230413151808.20900-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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
index 597bfbe19cc2..125e9331348c 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -266,7 +266,19 @@ static int cht_wc_leds_blink_set(struct led_classdev *cdev,
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
2.39.1

