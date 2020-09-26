Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A909E279C4B
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 22:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIZULj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 16:11:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbgIZULj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 16:11:39 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 069302389F;
        Sat, 26 Sep 2020 20:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601151099;
        bh=tGS8T6yScpkxoECBrdF2BfJkbCYhz+6giPoDxQKkyN0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yzB1rKL32WUtvU5ecQ+JAoIiswUfWlREqW0HvBExepZOd1fPItxdxn5Z5NNp1pQjk
         xiR2XflWiO+CKEr/+vhbBJktfzU2qn+YC2API7/29c4pFtk1RPcrde1b8hIjvLUhTF
         o8Nsp9oMyd8qYrZyDQUhStwVhtMCCiRio3kwQJng=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH leds v2 2/2] leds: ns2: do not guard OF match pointer with of_match_ptr
Date:   Sat, 26 Sep 2020 22:11:31 +0200
Message-Id: <20200926201131.23981-3-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200926201131.23981-1-kabel@kernel.org>
References: <20200926201131.23981-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Do not match OF match pointer with of_match_ptr, so that even if
CONFIG_OF is disabled, the driver can still be bound via another method.

Move definition of of_ns2_leds_match just before ns2_led_driver
definition, since it is not needed sooner.

Signed-off-by: Marek Behún <kabel@kernel.org>
Tested-by: Simon Guinot <simon.guinot@sequanux.org>
---
 drivers/leds/leds-ns2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index dba6bdfa861b..1677d66d8b0e 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -235,12 +235,6 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 	return ret;
 }
 
-static const struct of_device_id of_ns2_leds_match[] = {
-	{ .compatible = "lacie,ns2-leds", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
-
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -268,11 +262,17 @@ static int ns2_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id of_ns2_leds_match[] = {
+	{ .compatible = "lacie,ns2-leds", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
+
 static struct platform_driver ns2_led_driver = {
 	.probe		= ns2_led_probe,
 	.driver		= {
 		.name		= "leds-ns2",
-		.of_match_table	= of_match_ptr(of_ns2_leds_match),
+		.of_match_table	= of_ns2_leds_match,
 	},
 };
 
-- 
2.26.2

