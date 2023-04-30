Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0DD36F2A8C
	for <lists+linux-leds@lfdr.de>; Sun, 30 Apr 2023 22:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjD3UBA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Apr 2023 16:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbjD3UA6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2023 16:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6C0E4A
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2023 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682884810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mMOIb75AOkG8JsVZakgkuaihMohF69fNDS70z6e+bsk=;
        b=cXWsh1z2/SWxBNK4gJtPzLzp9Qfkiz8DwDBvQY23ZB6hDtcRTtwkrw2GL0/dCKdVkrsKU6
        AAUH+wUY5BIuGJmmx0UrRL/e47FIYzC6cBbzRlN42CanNyYQOHhsc75kFs2AD1jJEP48hL
        Np+ov2L2HRx9n2THyhTXxCP4e+OK5+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-qbQ6VsqEP5mENxDFjGJe7g-1; Sun, 30 Apr 2023 16:00:06 -0400
X-MC-Unique: qbQ6VsqEP5mENxDFjGJe7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F682185A78B;
        Sun, 30 Apr 2023 20:00:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC3EC15BA0;
        Sun, 30 Apr 2023 20:00:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: [PATCH v3 4/5] leds: cht-wcove: Set default trigger for charging LED
Date:   Sun, 30 Apr 2023 21:59:51 +0200
Message-Id: <20230430195952.862527-5-hdegoede@redhat.com>
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

Set a default trigger for the charging LED based on the machine-model
as set by the PMIC MFD driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/leds-cht-wcove.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 36fb4c2c3c13..ee9fb4bee018 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -351,6 +351,22 @@ static int cht_wc_leds_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	/* Set LED1 default trigger based on machine model */
+	switch (pmic->cht_wc_model) {
+	case INTEL_CHT_WC_GPD_WIN_POCKET:
+		leds->leds[0].cdev.default_trigger = "max170xx_battery-charging-blink-full-solid";
+		break;
+	case INTEL_CHT_WC_XIAOMI_MIPAD2:
+		leds->leds[0].cdev.default_trigger = "bq27520-0-charging-blink-full-solid";
+		break;
+	case INTEL_CHT_WC_LENOVO_YOGABOOK1:
+		leds->leds[0].cdev.default_trigger = "bq27542-0-charging-blink-full-solid";
+		break;
+	default:
+		dev_warn(&pdev->dev, "Unknown model, no default charging trigger\n");
+		break;
+	}
+
 	for (i = 0; i < CHT_WC_LED_COUNT; i++) {
 		struct cht_wc_led *led = &leds->leds[i];
 
-- 
2.39.2

