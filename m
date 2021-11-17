Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B62454710
	for <lists+linux-leds@lfdr.de>; Wed, 17 Nov 2021 14:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhKQNWS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Nov 2021 08:22:18 -0500
Received: from smtprelay02.ispgateway.de ([80.67.18.14]:19931 "EHLO
        smtprelay02.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbhKQNWR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Nov 2021 08:22:17 -0500
Received: from [92.206.166.137] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1mnH2b-0002o1-01; Wed, 17 Nov 2021 10:15:41 +0100
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH 1/3] leds: sgm3140: Add ocs,ocp8110 compatible
Date:   Wed, 17 Nov 2021 10:14:03 +0100
Message-Id: <20211117091405.7412-2-git@apitzsch.eu>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211117091405.7412-1-git@apitzsch.eu>
References: <20211117091405.7412-1-git@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Orient-Chip's ocp8110 has the same pin configuration as the sgm3140.
The data sheet can be found at:
https://cdn.datasheetspdf.com/pdf-down/O/C/P/OCP8110-OrientChip.pdf

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/leds/flash/leds-sgm3140.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index f4f831570f11..d3a30ad94ac4 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -290,6 +290,7 @@ static int sgm3140_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id sgm3140_dt_match[] = {
+	{ .compatible = "ocs,ocp8110" },
 	{ .compatible = "sgmicro,sgm3140" },
 	{ /* sentinel */ }
 };
-- 
2.34.0

