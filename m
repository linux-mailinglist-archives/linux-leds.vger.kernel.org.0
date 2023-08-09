Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA62775FCC
	for <lists+linux-leds@lfdr.de>; Wed,  9 Aug 2023 14:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjHIMx3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Aug 2023 08:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjHIMx3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Aug 2023 08:53:29 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CACB1BFF;
        Wed,  9 Aug 2023 05:53:27 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B24AB865ED;
        Wed,  9 Aug 2023 14:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1691585604;
        bh=eBzKyeVEk6eQYmGEjepxTeEC322lhvYCme6l2zEt8ms=;
        h=From:To:Cc:Subject:Date:From;
        b=hW2WCrXsPeBv3Qu5zDsvN0/L/VfmdgRxzdVCI+5qBUqFNgjt+E04rpOkJ65XcfCyY
         E+Swu6iDyMKo0zbA0GHL2vcrJqpGaPDMMSfimO3TZBO010Oo4PkgXhzUKVrd5sGM/N
         +bpt9TFuJruBpanjWU16wP6TADdyZr9qC0GOagBrTF1FnqCC5pzMza9hT5waZjhII5
         PS0li/ZVZEuF75xbq1xwgfHA766jr85BsahPJdWWjxom32SGzHs1hl35K1MQbYo7Qx
         xpMQ29pudcY1/rwAtW8eJlmCqPAHXAvhITLgMh7bGufomjhTOQilrCyvB61pCQbIiV
         kcMBxhN0nCZjQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] leds: pca995x: Fix MODULE_DEVICE_TABLE for OF
Date:   Wed,  9 Aug 2023 14:53:14 +0200
Message-Id: <20230809125314.531806-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix copy-paste error in MODULE_DEVICE_TABLE() for the OF table,
use the 'of' first parameter instead of duplicate 'i2c'.

Fixes: ee4e80b2962e ("leds: pca995x: Add support for PCA995X chips")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
NOTE: This should be added on top of leds-lj or squashed into the driver patch
---
 drivers/leds/leds-pca995x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 4c387e628ba8f..9b7667a03c390 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -181,7 +181,7 @@ static const struct of_device_id pca995x_of_match[] = {
 	{ .compatible = "nxp,pca9955b", .data = (void *)1 /* B-type chip */ },
 	{},
 };
-MODULE_DEVICE_TABLE(i2c, pca995x_of_match);
+MODULE_DEVICE_TABLE(of, pca995x_of_match);
 
 static struct i2c_driver pca995x_driver = {
 	.driver = {
-- 
2.40.1

