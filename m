Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0666E94AB
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 14:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjDTMik (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 08:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbjDTMij (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 08:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A69E6595
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681994270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oJVoPerbtHZRBVNWajBViqQxIMhhj3iJdrKPO95jMjw=;
        b=fccUM3fexEBPMeBnEWM814jUCnJcLWvInKLheiOy8Rq71OBmiOZ6vjoQZdb9ezz2gMDQ+O
        DJsq5bf004SQewWNzivEJDAC3iIBe4k2ze+fp81AelYTzGPPr3zQudImCly8K9IopQy0xx
        2xnhg/GAvADuVydZqJQWwjcNdgIX2iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-vmac4Y9MNwW-gL758O6tig-1; Thu, 20 Apr 2023 08:37:47 -0400
X-MC-Unique: vmac4Y9MNwW-gL758O6tig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3390B185A790;
        Thu, 20 Apr 2023 12:37:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.216])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 580A6492C3E;
        Thu, 20 Apr 2023 12:37:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH v2 4/5] leds: cht-wcove: Set default trigger for charging LED
Date:   Thu, 20 Apr 2023 14:37:40 +0200
Message-Id: <20230420123741.57160-5-hdegoede@redhat.com>
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

Set a default trigger for the charging LED based on the machine-model
as set by the PMIC MFD driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/leds-cht-wcove.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 23e97b08f6ea..7c395220251f 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -344,6 +344,25 @@ static int cht_wc_leds_probe(struct platform_device *pdev)
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
+	case INTEL_CHT_WC_LENOVO_YT3_X90:
+		leds->leds[0].cdev.default_trigger = "bq27500-1-charging-blink-full-solid";
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

