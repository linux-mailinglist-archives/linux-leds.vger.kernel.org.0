Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FECB11C41B
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfLLDkj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:58768 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727802AbfLLDkK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CDFB0ADE1;
        Thu, 12 Dec 2019 03:40:08 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [RFC 25/25] WIP: leds: tm1628: Prepare AiP1618 keys
Date:   Thu, 12 Dec 2019 04:39:52 +0100
Message-Id: <20191212033952.5967-26-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Extend definition with key input lines.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 drivers/leds/leds-tm1628.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
index 2caf1e63fc90..e28809d9a700 100644
--- a/drivers/leds/leds-tm1628.c
+++ b/drivers/leds/leds-tm1628.c
@@ -699,6 +699,8 @@ static const struct tm1628_info aip1618_info = {
 	.seg_mask = GENMASK(14, 12) | GENMASK(5, 1),
 	.modes = aip1618_modes,
 	.default_mode = 3,
+	.k_mask = BIT(2),
+	.ks_mask = GENMASK(5, 1),
 	.pwm_map = tm1628_pwm_map,
 	.default_pwm = 0,
 };
-- 
2.16.4

