Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5D076D351
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 18:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjHBQIP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 12:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235494AbjHBQIA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 12:08:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B146B171B
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 09:07:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15FC361A3D
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 16:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72933C433CC;
        Wed,  2 Aug 2023 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690992476;
        bh=avOfQmV9Z9Lnbmep5+IC25tsNLI6S6GVFISxDXZdVvc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CqJiJNrH8ipg3m6gOM0AuzAcarWZEKP4l3FLswivObKCd7GWI7to6HThaXNNbgsiu
         sed4V/TJFE2+kmX0X5ic2ErrvAPZSVrvLYzgEpRMrEVcP/buLccgDtJ88As2O6UyY4
         lNGSBAxwTKB0rft++gO1FRKDUUY5clmBBphRpfhf0BPvv0p/rHGMLOGFtrl4GquZIS
         FhmJ9yURL8+egjxVIFQ0pm4OW7w/o5GxmzLFqBjWzxAzzUnVgKZKw9CWphVM0Wucoe
         8e05GtbMvMM/Lp+pr3nmfq2r4heuXZGUQHdma+JWAMdPs1lL5pc8UPfQgmGUAnSQm3
         UImtrb00e41VA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 3/6] leds: turris-omnia: use sysfs_emit() instead of sprintf()
Date:   Wed,  2 Aug 2023 18:07:45 +0200
Message-ID: <20230802160748.11208-4-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802160748.11208-1-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the dedicated sysfs_emit() function instead of sprintf() in sysfs
attribute accessor brightness_show().

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bb2a2b411a56..9fca0acb2270 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -196,7 +196,7 @@ static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%d\n", ret);
+	return sysfs_emit(buf, "%d\n", ret);
 }
 
 static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
-- 
2.41.0

