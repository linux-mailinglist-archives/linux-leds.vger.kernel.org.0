Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163CC673319
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jan 2023 08:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjASH5w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Jan 2023 02:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjASH5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Jan 2023 02:57:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906D65594
        for <linux-leds@vger.kernel.org>; Wed, 18 Jan 2023 23:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674115027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kYtsbPz7M17eh6kFz8vJWs+LDAT2GZJx0YZ3mAc1VOY=;
        b=RZDD0rrbYV+KnHo13ZHIzPZQgupGkCzab0k8Gba5tcBS6eW9nc6lY92leo8Yk3h6e2zqIg
        s3taoXg/oEhkkDIFFe/KP1LPB/8sGTiKVpzWc86aab0m9Bo0Xxg1GFJF8Bp/DwCKLCyxfd
        EQqC1gq4Jr5VQnYS2lcgZwQkvvW69Aw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-0qbfJw_3N8O9MdJ49TFViQ-1; Thu, 19 Jan 2023 02:57:01 -0500
X-MC-Unique: 0qbfJw_3N8O9MdJ49TFViQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16E338A0108;
        Thu, 19 Jan 2023 07:57:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.190])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8433C2026D68;
        Thu, 19 Jan 2023 07:56:58 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/3] platform: x86: int3472: Add MFD cell for tps68470 LED
Date:   Thu, 19 Jan 2023 15:56:24 +0800
Message-Id: <20230119075626.767135-2-hpa@redhat.com>
In-Reply-To: <20230119075626.767135-1-hpa@redhat.com>
References: <20230119075626.767135-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add MFD cell for tps68470-led.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 5b8d1a9620a5..9dceb6507a01 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -17,7 +17,7 @@
 #define DESIGNED_FOR_CHROMEOS		1
 #define DESIGNED_FOR_WINDOWS		2
 
-#define TPS68470_WIN_MFD_CELL_COUNT	3
+#define TPS68470_WIN_MFD_CELL_COUNT	4
 
 static const struct mfd_cell tps68470_cros[] = {
 	{ .name = "tps68470-gpio" },
@@ -194,6 +194,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
 		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
 		cells[2].name = "tps68470-gpio";
+		cells[3].name = "tps68470-led";
 
 		for (i = 0; i < board_data->n_gpiod_lookups; i++)
 			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-- 
2.39.0

