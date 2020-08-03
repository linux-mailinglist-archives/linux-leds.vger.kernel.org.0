Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31E823A1AE
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 11:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgHCJTs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 05:19:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgHCJTr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 Aug 2020 05:19:47 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DEF220719;
        Mon,  3 Aug 2020 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596446386;
        bh=DofFcpUFjE06yqe2NdDV1H4PmyUGdMscl+cYpBWQ+S4=;
        h=From:To:Subject:Date:From;
        b=p3zepOYA6fnzuYz42SncJwEHhW1Zpoejn+/Pc1Bq67KMvxz0oBcYliVvg9V2qiVXX
         hVuhNW1iYDnOA504vgXTxYKMHV6bFu1FivB3kQeyUzXKVgmqHrg42JGY7cky6gZQnX
         h2wKW1BkoqPDWnZJl+GnQZcDJeQWq3KWZpiGUG8k=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] leds: s3c24xx: Remove unused machine header include
Date:   Mon,  3 Aug 2020 11:19:36 +0200
Message-Id: <20200803091936.24984-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver includes machine header for GPIO registers but actually does
not use them.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/leds-s3c24xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 9b5e67664ba3..3c0c7aa63b8c 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -16,8 +16,6 @@
 #include <linux/module.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 
-#include <mach/regs-gpio.h>
-
 /* our context */
 
 struct s3c24xx_gpio_led {
-- 
2.17.1

