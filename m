Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65846348B4
	for <lists+linux-leds@lfdr.de>; Tue, 22 Nov 2022 21:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbiKVUsv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Nov 2022 15:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbiKVUsm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Nov 2022 15:48:42 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5041DE3D
        for <linux-leds@vger.kernel.org>; Tue, 22 Nov 2022 12:48:41 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id 11so11884260iou.0
        for <linux-leds@vger.kernel.org>; Tue, 22 Nov 2022 12:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUfAXXISs8sZj+gKsrx2+PPqyWsFBSmyByYJxrMQRCU=;
        b=Ly4CWsMpbetOsjGtfHoSI0AyJt/j+cgj7TU0CcWHFhWhUeAbyeBHnRkPWg/N8XpH5R
         QSdaA80i5qtZF9GUb4SzyidBnsUa7EDJHGzTS9oz1atz5kKSfd1XRbvkAl2UPS7GJOvR
         dBaAaSk3Qi9erRayCgEH8yA9ZYKeNkhF8/SjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUfAXXISs8sZj+gKsrx2+PPqyWsFBSmyByYJxrMQRCU=;
        b=MSLUgytjQ1IoaHHtejX1xPhC8TkFIsJcmCkCefGqo01gM8H4OHfS+uP2RO6Vw0gWWW
         iiLVwIMWmTqCGj9JfOx9UBUspk++ZgszkYfGZn4MHId9m9S2Aq+qmeVdXAsi3a0jE4Mq
         94WXRZq1yHj0w33w7k6qLdULcC/HokuDP+7GAfwLTk50aiY6PpdN3+lGpAVcq2hRoqW0
         Y6UHf/WM855FD3Y3nQORb1sz4LbgiZqDBzaFnw3TkxOcu8u5goqR+5Nmu++j61F2qxVd
         +i2sGDnKw5PGOukNHFGCxkOFse605tUrM4Y349TWC3mc1juj0E4AR+BCcurz5CeXEKg7
         Iecg==
X-Gm-Message-State: ANoB5pmrMgbSLtRA3K7y2Q4/BX9YEtB+4CwFRNhopaxYtUCqDDy8RP8w
        awZTVgCzoQ28Qy+Rae46UfndlQ==
X-Google-Smtp-Source: AA0mqf7ZFBkUv+Zr0xS3S1jpSjhFCvDBjb7+Om0WGRKLeSq6k0BvyjEu105eIvDTrIYrNkECeIaVZQ==
X-Received: by 2002:a05:6602:200c:b0:6de:90a6:6b04 with SMTP id y12-20020a056602200c00b006de90a66b04mr9899854iod.101.1669150120581;
        Tue, 22 Nov 2022 12:48:40 -0800 (PST)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id s16-20020a92cc10000000b00302b5d0d07asm1948431ilp.17.2022.11.22.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 12:48:39 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     pavel@ucw.cz
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] leds: leds-wm831x-status: init chip_pdata before access
Date:   Tue, 22 Nov 2022 13:48:37 -0700
Message-Id: <20221122204837.11611-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

wm831x_status_probe() accesses status from chip_pdata before
initializing it. Fix it.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/leds/leds-wm831x-status.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index c48b80574f02..5060c83f3b25 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -212,7 +212,7 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	struct wm831x_status_pdata pdata;
 	struct wm831x_status *drvdata;
 	struct resource *res;
-	int id = pdev->id % ARRAY_SIZE(chip_pdata->status);
+	int id;
 	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_REG, 0);
@@ -229,9 +229,10 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	drvdata->wm831x = wm831x;
 	drvdata->reg = res->start;
 
-	if (dev_get_platdata(wm831x->dev))
+	if (dev_get_platdata(wm831x->dev)) {
 		chip_pdata = dev_get_platdata(wm831x->dev);
-	else
+		id = pdev->id % ARRAY_SIZE(chip_pdata->status);
+	} else
 		chip_pdata = NULL;
 
 	memset(&pdata, 0, sizeof(pdata));
-- 
2.34.1

