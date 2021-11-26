Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181DC45EA20
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 10:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359806AbhKZJR4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 04:17:56 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:54025 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376264AbhKZJP4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Nov 2021 04:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637917963; x=1669453963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=n02R8J5V+BGfJ3PEtmKdHU9NtSsqTzWCr0licA03nak=;
  b=i1MpQc4r5w+2+8I4jWIxfKmKNF7WW9Dxl3MwMO0vC0uvcV+jZOfl8FSu
   g/r4N0cDHn9e570Gs94eKj+0x35wcONay6cQN3hMfx+mjuoWmPqTM0GfE
   p4l12sBzi4HFGzTZhQw3eJb97Qy7cf0vk3Gp/T42lPm7BB9aSM5G2HYSz
   o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Nov 2021 01:12:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 01:12:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:42 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:39 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <quic_tsoni@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [RESEND PATCH V3 3/4] arm64: dts: qcom: pm8350c: Add pwm support
Date:   Fri, 26 Nov 2021 14:41:59 +0530
Message-ID: <1637917920-22041-4-git-send-email-quic_c_skakit@quicinc.com>
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

Add pwm support for PM8350C pmic.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V2:
 - Dropped suffix '4' from pwm phandle and removed "status=ok".

Changes in V3:
  - Add reg property.

 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index e1b75ae..1ba6318 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -29,6 +29,13 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm8350c_pwm: pwm@e800 {
+			compatible = "qcom,pm8350c-pwm";
+			reg = <0xe800>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.7.4

