Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F7F4333E8
	for <lists+linux-leds@lfdr.de>; Tue, 19 Oct 2021 12:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbhJSKvm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Oct 2021 06:51:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:24050 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235307AbhJSKvk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Oct 2021 06:51:40 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 03:49:28 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 Oct 2021 03:49:26 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Oct 2021 16:19:09 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 5681C5514; Tue, 19 Oct 2021 16:19:08 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, swboyd@chromium.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 2/3] leds: Add pm8350c support to Qualcomm LPG driver
Date:   Tue, 19 Oct 2021 16:18:50 +0530
Message-Id: <1634640531-15813-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634640531-15813-1-git-send-email-skakit@codeaurora.org>
References: <1634640531-15813-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: satya priya <skakit@codeaurora.org>

Add pm8350c compatible and lpg_data to the driver.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in V2:
 - Added const for lpg_channel_data[] struct.

 drivers/leds/rgb/leds-qcom-lpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 45ef4ec..99235af 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1275,9 +1275,19 @@ static const struct lpg_data pm8150l_lpg_data = {
 	},
 };
 
+static const struct lpg_data pm8350c_pwm_data = {
+	.pwm_9bit_mask = BIT(2),
+
+	.num_channels = 1,
+	.channels = (const struct lpg_channel_data[]) {
+		{ .base = 0xeb00 },
+	},
+};
+
 static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
 	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
+	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
 	{ .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

