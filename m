Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F60381E29
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhEPKzI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:47668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhEPKzH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D41B361185;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=bQ3MnldJSx8+sco79kPklGNg7LH+HvdUVOXzNu/8s/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q28opKS/7NRZM/NCZVZkBIcKBjPAMhx4qof2EOdhzzDcPx+zuGFs0QPXdMIu0MNNV
         WHLbPQOvsLGkCXVbWA2S6PysQLbHS4wcRmL6oaAbm0ox4B/hWyh4EqatcKGHwCc3lu
         NO5TmD4+HZJRfj/KH9hdvVsoiWBn0iPf82LowooqYBhipK5L9j4hFCcHazngjdAIHK
         ApCvE9DDOiKBDTyO1JX3ug3YKw4O0DOz4eATPUjxEjrfNos1vXUULUQfZvxDtyQoqv
         OeaUOS6jVgnaf0PHwjYZfq8wNqspfzaslZjcyjA9QXmmSStEh7o1GnrT94GAV5qJZC
         CWnFmJI7GUUbg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s84-NE; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/17] staging: nuc-wmi: detect WMI API detection
Date:   Sun, 16 May 2021 12:53:30 +0200
Message-Id: <602bd7c90e1e569f52db10bbe451af0436300b78.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There are currently 3 known API releases:
            - https://www.intel.com/content/www/us/en/support/articles/000023426/intel-nuc/intel-nuc-kits.html
            - https://raw.githubusercontent.com/nomego/intel_nuc_led/master/specs/INTEL_WMI_LED_0.64.pdf
            - https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf

Add a logic to detect between them, preventing the driver
to work with an unsupported version.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 15d956ad8556..b75ddd47e443 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -26,6 +26,13 @@
 #define NUM_INPUT_ARGS		4
 #define NUM_OUTPUT_ARGS		3
 
+enum led_api_rev {
+	LED_API_UNKNOWN,
+	LED_API_NUC6,
+	LED_API_REV_0_64,
+	LED_API_REV_1_0,
+};
+
 enum led_cmds {
 	LED_QUERY			= 0x03,
 	LED_NEW_GET_STATUS		= 0x04,
@@ -33,6 +40,7 @@ enum led_cmds {
 	LED_SET_VALUE			= 0x06,
 	LED_NOTIFICATION		= 0x07,
 	LED_SWITCH_TYPE			= 0x08,
+	LED_VERSION_CONTROL             = 0x09,
 };
 
 enum led_query_subcmd {
@@ -195,7 +203,7 @@ static int nuc_wmi_query_leds(struct device *dev)
 	struct nuc_wmi *priv = dev_get_drvdata(dev);
 	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
 	u8 output[NUM_OUTPUT_ARGS];
-	int i, id, ret;
+	int i, id, ret, ver = LED_API_UNKNOWN;
 	u8 leds;
 
 	/*
@@ -209,12 +217,28 @@ static int nuc_wmi_query_leds(struct device *dev)
 	cmd = LED_QUERY;
 	input[0] = LED_QUERY_LIST_ALL;
 	ret = nuc_nmi_cmd(dev, cmd, input, output);
-	if (ret) {
+	if (ret == -ENOENT) {
+		ver = LED_API_NUC6;
+	} else if (ret) {
 		dev_warn(dev, "error %d while listing all LEDs\n", ret);
 		return ret;
+	} else {
+		leds = output[0];
 	}
 
-	leds = output[0];
+	if (ver != LED_API_NUC6) {
+		ret = nuc_nmi_cmd(dev, LED_VERSION_CONTROL, input, output);
+		ver = output[0] | output[1] << 16;
+		if (!ver)
+			ver = LED_API_REV_0_64;
+		else if (ver == 0x0126)
+			ver = LED_API_REV_1_0;
+	}
+
+	/* Currently, only API Revision 0.64 is supported */
+	if (ver != LED_API_REV_0_64)
+		return -ENODEV;
+
 	if (!leds) {
 		dev_warn(dev, "No LEDs found\n");
 		return -ENODEV;
-- 
2.31.1

