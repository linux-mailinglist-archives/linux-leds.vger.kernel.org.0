Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A29CB26191
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 12:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfEVKSG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 06:18:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46438 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfEVKSG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 06:18:06 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hTOJd-0008T1-NZ; Wed, 22 May 2019 10:17:45 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] leds: TI LMU: fix u8 variable comparisons with less than zero
Date:   Wed, 22 May 2019 11:17:45 +0100
Message-Id: <20190522101745.21828-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The u8 variables ramp_ups and ramp_downs are being compared to less
than zero, this will always be false.  Fix this by making the ramp
variables ints.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 9a8e66ebeaa2 ("leds: TI LMU: Add common code for TI LMU devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: make u8 vars ints rather than removing the comparison. Thanks once
more to Dan Carpenter for spotting my clearly stupid V1 version and
correcting my mistake.

---
 drivers/leds/leds-ti-lmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index adc7293004f1..c9ab40d5a6ba 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -84,7 +84,7 @@ static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
 int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
 {
 	struct regmap *regmap = lmu_bank->regmap;
-	u8 ramp, ramp_up, ramp_down;
+	int ramp, ramp_up, ramp_down;
 
 	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
 		ramp_up = 0;
-- 
2.20.1

