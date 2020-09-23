Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B604D2759C5
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 16:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgIWOS5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 10:18:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:58130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgIWOS4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Sep 2020 10:18:56 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 962E723119;
        Wed, 23 Sep 2020 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600870736;
        bh=/iXTLQPXwNgZ5wPaXUNmRBdx1vO/FphGVq3Gqs29qKY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YB47pjoMBmk4Oxu8L/1na4JOue6ACjQsxDCUFfDFnNFdKTws1ygorYyjRZJ795CVL
         fBZyPV9xRYbu7F90wAqaWpzRGO9uHJQKnlffxjrOxJB27vMHEWCoNl/asxa8QC88wm
         DQf0G6VmoRD6bPj0NyOqoistaXD5zeVmgUwfx8DU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH leds 2/2] leds: ns2: do not guard OF match pointer with of_match_ptr
Date:   Wed, 23 Sep 2020 16:18:40 +0200
Message-Id: <20200923141840.6333-3-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923141840.6333-1-kabel@kernel.org>
References: <20200923141840.6333-1-kabel@kernel.org>
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
Cc: Simon Guinot <simon.guinot@sequanux.org>
---
 drivers/leds/leds-ns2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 427b5059206a5..4ea6e61aacddf 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -239,12 +239,6 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
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
@@ -272,11 +266,17 @@ static int ns2_led_probe(struct platform_device *pdev)
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

