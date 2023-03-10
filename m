Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C886B3B72
	for <lists+linux-leds@lfdr.de>; Fri, 10 Mar 2023 10:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbjCJJ5y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Mar 2023 04:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjCJJ5x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Mar 2023 04:57:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D05106A3A
        for <linux-leds@vger.kernel.org>; Fri, 10 Mar 2023 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678442227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mfMH4fZrJgKQsTUs6xU51M8btp6H5Xdte3Rx0tvuNm8=;
        b=fbfrsAxXaFhyc51uLJSoyEJNyh/4U5AdU48M6c2+kdFQGHlG5a47biRxm8PVSE/eJ76USA
        77mkHYkmbuyM8UguoqdH9lD3mr+y3pCtC6UNh6bqNgKMEN8zOfP00XmhZkMYgifQCtjLO5
        ++kWjTPf3+snmz5eozSERwzHgecYE1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-hm88C8yGNK6TUWIEyMMUfA-1; Fri, 10 Mar 2023 04:57:06 -0500
X-MC-Unique: hm88C8yGNK6TUWIEyMMUfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8D7A857F49;
        Fri, 10 Mar 2023 09:57:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.100])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 356252166B2A;
        Fri, 10 Mar 2023 09:57:01 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 1/4] platform: x86: int3472: Add MFD cell for tps68470 LED
Date:   Fri, 10 Mar 2023 17:56:32 +0800
Message-Id: <20230310095635.813262-2-hpa@redhat.com>
In-Reply-To: <20230310095635.813262-1-hpa@redhat.com>
References: <20230310095635.813262-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add MFD cell for tps68470-led.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 5b8d1a9620a5..82ef022f8916 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -17,7 +17,7 @@
 #define DESIGNED_FOR_CHROMEOS		1
 #define DESIGNED_FOR_WINDOWS		2
 
-#define TPS68470_WIN_MFD_CELL_COUNT	3
+#define TPS68470_WIN_MFD_CELL_COUNT	4
 
 static const struct mfd_cell tps68470_cros[] = {
 	{ .name = "tps68470-gpio" },
@@ -193,7 +193,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		cells[1].name = "tps68470-regulator";
 		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
 		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
-		cells[2].name = "tps68470-gpio";
+		cells[2].name = "tps68470-led";
+		cells[3].name = "tps68470-gpio";
 
 		for (i = 0; i < board_data->n_gpiod_lookups; i++)
 			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-- 
2.37.3

