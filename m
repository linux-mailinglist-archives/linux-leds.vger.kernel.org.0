Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B642387BFD
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245562AbhERPK2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:10:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:49412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237974AbhERPK2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C4AC61042;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=IPk6MBpB/XcYX8hxt1d+r0HxwF2eMb4v4R5nHNEAMoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o9MbXM51OrGYylej2Azv0sWdy0oIXvObDT9T1v/FiizWiyNlbwE2kaQmcgJr0CW2d
         EUzyBl8A35i409JCm22FvwTjF0KkY34l3ScM3VzOERiTMMBUgm9PV/GQ+bcIRshywi
         DFixOHyA9y+PoJKBWE2IgI49Qggjm3opWocxYgJannksbgI5ElhYkaKE8xCNB0MLVs
         Jole2D+301QF8mp8GoIcPxxE3LRdFrtSsUmHkc2v73ESPUUnZI7ObWozbJRdN5+Bzm
         D7kAMlrU4tm3ta1M6bjHCZ3ln0MaKzvuN1ajkWAB4MY2v81NANduVXhRlfTPlWATjp
         g5l2sHDVFyfBQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HO6-2k; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 03/17] leds: leds-nuc: detect WMI API detection
Date:   Tue, 18 May 2021 17:08:52 +0200
Message-Id: <db42809795aaabd0b11702a5c39cafc1594b6675.1621349814.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621349813.git.mchehab+huawei@kernel.org>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
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
 drivers/leds/leds-nuc.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index 69bab319122e..26bc4a4bb57c 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
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
@@ -209,12 +217,31 @@ static int nuc_wmi_query_leds(struct device *dev)
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
+		if (ret)
+			return ret;
+
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

