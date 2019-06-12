Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E8642A0F
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2019 16:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfFLO5D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Jun 2019 10:57:03 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50285 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfFLO5D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Jun 2019 10:57:03 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hb4gN-00078Q-Qx; Wed, 12 Jun 2019 14:56:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH][next] leds: lm36274: remove redundant initialization of variable ret
Date:   Wed, 12 Jun 2019 15:56:59 +0100
Message-Id: <20190612145659.26514-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never
read, hence it is redundant and can be removed.  Also move the
declaration of ret to the for loop scope.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lm36274.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index ed9dc857ec8f..b55bd238c074 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -74,7 +74,6 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
 	struct device *dev = &lm36274_data->pdev->dev;
 	const char *name;
 	int child_cnt;
-	int ret = -EINVAL;
 
 	/* There should only be 1 node */
 	child_cnt = device_get_child_node_count(dev);
@@ -82,6 +81,8 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
 		return -EINVAL;
 
 	device_for_each_child_node(dev, child) {
+		int ret;
+
 		ret = fwnode_property_read_string(child, "label", &name);
 		if (ret)
 			snprintf(label, sizeof(label),
-- 
2.20.1

