Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BC367331A
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jan 2023 08:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjASH57 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Jan 2023 02:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjASH56 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Jan 2023 02:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894152682
        for <linux-leds@vger.kernel.org>; Wed, 18 Jan 2023 23:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674115030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UyUgDYKS+yK3FOwur5h8SS2dgbZdk4kY607ebzoiPIQ=;
        b=TXL86B408fD+WUhWt/9hS5S5cjQM1Fn6Nzi17UiZMVh4V8v5pEQSsEtImJmU/3iJgqxXKa
        +lmy45zoqVQgX0IO75g/31VwE5JbJ79Q84686iRV2XGwaQwn5ol07Lrk3ZHPbgYW8Ho+1T
        V3Lpqq1Y3+EM/fwquzGo7DJiufMp2BQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-oyLM07-ZOcel1wzm1wB4pw-1; Thu, 19 Jan 2023 02:57:09 -0500
X-MC-Unique: oyLM07-ZOcel1wzm1wB4pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17AD8800B30;
        Thu, 19 Jan 2023 07:57:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.190])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 81EAB2026D68;
        Thu, 19 Jan 2023 07:57:06 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 2/3] include: mfd: tps68470: Add masks for LEDA and LEDB
Date:   Thu, 19 Jan 2023 15:56:25 +0800
Message-Id: <20230119075626.767135-3-hpa@redhat.com>
In-Reply-To: <20230119075626.767135-1-hpa@redhat.com>
References: <20230119075626.767135-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add flags for both LEDA(TPS68470_ILEDCTL_ENA), LEDB
(TPS68470_ILEDCTL_ENB), and current control mask for LEDB
(TPS68470_ILEDCTL_CTRLB)

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 include/linux/mfd/tps68470.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index 7807fa329db0..2d2abb25b944 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -34,6 +34,7 @@
 #define TPS68470_REG_SGPO		0x22
 #define TPS68470_REG_GPDI		0x26
 #define TPS68470_REG_GPDO		0x27
+#define TPS68470_REG_ILEDCTL		0x28
 #define TPS68470_REG_VCMVAL		0x3C
 #define TPS68470_REG_VAUX1VAL		0x3D
 #define TPS68470_REG_VAUX2VAL		0x3E
@@ -94,4 +95,8 @@
 #define TPS68470_GPIO_MODE_OUT_CMOS	2
 #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
 
+#define TPS68470_ILEDCTL_ENA		BIT(2)
+#define TPS68470_ILEDCTL_ENB		BIT(6)
+#define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
+
 #endif /* __LINUX_MFD_TPS68470_H */
-- 
2.39.0

