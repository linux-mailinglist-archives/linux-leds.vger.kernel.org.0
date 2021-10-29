Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343A943FBAD
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 13:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhJ2LsB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 07:48:01 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38711 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231502AbhJ2LsA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 29 Oct 2021 07:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635507932; x=1667043932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=yt96B3qqu9bPYlPmEiQjWT+sHbNg39rHUqVdWc44Izc=;
  b=mlPdPT7adxeP2on4yRNVM5dZ1lMKuVB+NnrqE/Nq9XNKlSS3zBRDFto+
   GX12nKGFX2iuxjTjuDsMxWjWdoyLEDIQxJJFyAWk9t+Ve6eH0Cd6mHg3Q
   fMuRfLSnhjM+9GOaxc9wNphNLuqMemhDGcGyUoL4yI68BuQ75LO7RLTBJ
   s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 04:45:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 04:45:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:30 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:27 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 3/4] arm64: dts: qcom: pm8350c: Add pwm support
Date:   Fri, 29 Oct 2021 17:14:52 +0530
Message-ID: <1635507893-25490-4-git-send-email-quic_c_skakit@quicinc.com>
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

Add pwm support for PM8350C pmic.

Signed-off-by: satya priya <skakit@codeaurora.org>
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

