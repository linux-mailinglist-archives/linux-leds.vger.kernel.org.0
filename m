Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F3145EA1C
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 10:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359644AbhKZJRx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 04:17:53 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27580 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231294AbhKZJPw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Nov 2021 04:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637917959; x=1669453959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lyBzCTD3Sp+JtqsNz/bUwdq+Thog8RwB3gmYXNdNlqc=;
  b=nsxFB4rN3yts7Q7XqHkGb/cLYbaaKkdNqRQczQ0N2l6936+wf4CNZTGT
   XEUcqONcl888znFGQEttHXkTVKn3sjDnbF5lFrg78FKS0CWhxhzYlm8RU
   C7NlsTk2omTQmrhABb0bh/r0d+c9e+p4lRpyAaSm/Uiriojf6kygjAfOm
   o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Nov 2021 01:12:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 01:12:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:39 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:35 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <quic_tsoni@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [RESEND PATCH V3 2/4] leds: Add pm8350c support to Qualcomm LPG driver
Date:   Fri, 26 Nov 2021 14:41:58 +0530
Message-ID: <1637917920-22041-3-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637917920-22041-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637917920-22041-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add pm8350c compatible and lpg_data to the driver.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V2:
 - Added const for lpg_channel_data[] struct.

Changes in V3:
  - Correct the num_channels and add respective base addresses.

 drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 45ef4ec..ad99a9b 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1275,9 +1275,22 @@ static const struct lpg_data pm8150l_lpg_data = {
 	},
 };
 
+static const struct lpg_data pm8350c_pwm_data = {
+	.pwm_9bit_mask = BIT(2),
+
+	.num_channels = 4,
+	.channels = (const struct lpg_channel_data[]) {
+		{ .base = 0xe800 },
+		{ .base = 0xe900 },
+		{ .base = 0xea00 },
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
2.7.4

