Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0F6625F71
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 10:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbfEVI1H (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 04:27:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44254 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfEVI1H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 04:27:07 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hTMZv-0008N0-E9; Wed, 22 May 2019 08:26:27 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with less than zero
Date:   Wed, 22 May 2019 09:26:27 +0100
Message-Id: <20190522082627.18354-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The u8 variables ramp_up and ramp_down are being compared to less
than zero, this will always be false. Code is redundant so remove
it.

Addresses-Coverity: ("Unsigned compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-ti-lmu-common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index adc7293004f1..6db47accfe62 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -94,9 +94,6 @@ int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
 		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
 	}
 
-	if (ramp_up < 0 || ramp_down < 0)
-		return -EINVAL;
-
 	ramp = (ramp_up << 4) | ramp_down;
 
 	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
-- 
2.20.1

