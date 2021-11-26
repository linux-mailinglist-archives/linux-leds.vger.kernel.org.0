Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C928A45EA17
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 10:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353219AbhKZJRv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 04:17:51 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27569 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376260AbhKZJPu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Nov 2021 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637917957; x=1669453957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tasWJGzGYqyHJi2061m9WkcsOZsCnYAK8vRbSExbLGY=;
  b=HjVBaBeR6eypd6AN5PFhSX2pYEyRBk30OWFPFz52inMJgwYQvvmAke8I
   lPafItkp+z5Ds9kqsATlxWMu6ujb1imghEjtLU2ic9FfWHvsZyaNrlGxT
   nNFnuKZRmryu8cOwxNE0v93qaAHTXJKGEuO43/SM5QE8XMlzKhLa8MtPi
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Nov 2021 01:12:37 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 01:12:36 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:35 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:31 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <quic_tsoni@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [RESEND PATCH V3 1/4] dt-bindings: leds: Add pm8350c pmic support
Date:   Fri, 26 Nov 2021 14:41:57 +0530
Message-ID: <1637917920-22041-2-git-send-email-quic_c_skakit@quicinc.com>
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

Add pm8350c pmic pwm support.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in V2:
 - No changes.

Changes in V3:
 - No changes.

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 336bd8e..409a4c7 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,pm8150b-lpg
       - qcom,pm8150l-lpg
+      - qcom,pm8350c-pwm
       - qcom,pm8916-pwm
       - qcom,pm8941-lpg
       - qcom,pm8994-lpg
-- 
2.7.4

