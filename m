Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65E243FBA9
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 13:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhJ2Lr4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 07:47:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:15613 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231431AbhJ2Lry (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 29 Oct 2021 07:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635507926; x=1667043926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mi0sdBpG49G5h3+Ix/HVKQvWpmMOsZ9XHvRwQ2v4Zrw=;
  b=jjXe07d1E0MOp/9bJCWHU+V3RhwqKeUvuwBTFw++ghwTvGi4duII4PsF
   WFX5WVLvIQdUJP3Zxf33EV4+z49pVd0F3IteW8aSjq/LXUCzRVMex7nP3
   rjhsCLCBp+PEuCD+bYnJJW5z0iOVreXROnfKDLAMfV8qq4XW2wsIjaydZ
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2021 04:45:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 04:45:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:25 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:22 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 2/4] leds: Add pm8350c support to Qualcomm LPG driver
Date:   Fri, 29 Oct 2021 17:14:51 +0530
Message-ID: <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

