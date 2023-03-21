Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C78E56C35DC
	for <lists+linux-leds@lfdr.de>; Tue, 21 Mar 2023 16:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjCUPjG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Mar 2023 11:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjCUPi7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Mar 2023 11:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9DC61AE
        for <linux-leds@vger.kernel.org>; Tue, 21 Mar 2023 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679413088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i91Zf8ByYdQM7B/EKPJTu4sAZ8EPImmPxU43hZ0Z4WI=;
        b=Wv05UBOHpCEVaReVG7Tniv3fjxynA8VEnC6I6+yf63phyqXRsy2Z1VCGyabZfb50RL7XxB
        OCT5TaLtUXsx4V67GDKC4ZYpnnsxIAe0BRfT+vtgnqm0VJd37xtGRnoIOqY5q6XG25AXIr
        WY49w8G8UYV01cX5qfl+p7MXr7UC4O8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-lL582GY2PJmI7ADimkX2Hg-1; Tue, 21 Mar 2023 11:38:01 -0400
X-MC-Unique: lL582GY2PJmI7ADimkX2Hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD14101A550;
        Tue, 21 Mar 2023 15:37:56 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 01C3040BC798;
        Tue, 21 Mar 2023 15:37:51 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 1/3] platform: x86: int3472: Add MFD cell for tps68470 LED
Date:   Tue, 21 Mar 2023 23:37:16 +0800
Message-Id: <20230321153718.1355511-2-hpa@redhat.com>
In-Reply-To: <20230321153718.1355511-1-hpa@redhat.com>
References: <20230321153718.1355511-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
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
2.39.2

