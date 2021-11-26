Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C8645EA24
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 10:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376258AbhKZJR7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 04:17:59 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27617 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376266AbhKZJP7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Nov 2021 04:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637917967; x=1669453967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=NKEL6oeXlSb03z5C/6SFh048XbvDf9GKjlJDwtbjnv0=;
  b=D5iH8aenDQF4Pymf8ekn7okvPmNAh3frsTS30qRVJ9BetVrYJxg04Ji6
   gsDbUH84H3DmfzqETvJ9OKByi5Hxdami2jPTELivhRrNGf7d3NPYlnwSm
   34yqq/lApnxGDKbpaZ+/e5ait66NRBEN6V+fShhQ/WdGoUW9EqUjWo+XD
   4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Nov 2021 01:12:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 01:12:46 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:46 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:42 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <quic_tsoni@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [RESEND PATCH V3 4/4] arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2
Date:   Fri, 26 Nov 2021 14:42:00 +0530
Message-ID: <1637917920-22041-5-git-send-email-quic_c_skakit@quicinc.com>
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

Enable pm8350c pmic pwm support for backlight on sc7280-idp2.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V3:
 - New patch added in V3, to enable pwm support on sc7280-idp2 board.

 arch/arm64/boot/dts/qcom/sc7280-idp2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
index 3ae9969..07ca295 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
@@ -29,3 +29,7 @@
 &nvme_3v3_regulator {
 	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 };
+
+&pm8350c_pwm {
+	status = "okay";
+};
-- 
2.7.4

