Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBAF43FBA5
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 13:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhJ2Lrv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 07:47:51 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38688 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229556AbhJ2Lru (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 29 Oct 2021 07:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635507922; x=1667043922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=PE4FUd7hY9CnopwaKjFj9NyIPLFKPz2yn48JAdr69C4=;
  b=FaOK7xN1oNOufpUv8ALj1W0B4FjmITA7nDzKq6iLWzc6C2FyxVby4K7/
   U+X9iyEgKsbXC+KozHTXdg1sHIxhF5VXmVG5TSPiMBFQOkzn+eYiY+FRw
   HRJdb2XViIya4GVqG6D3gT8e4ZyuS0spzx18Mg1laTgdzM6s5KGdxQdX9
   4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Oct 2021 04:45:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 04:45:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:21 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:17 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 1/4] dt-bindings: leds: Add pm8350c pmic support
Date:   Fri, 29 Oct 2021 17:14:50 +0530
Message-ID: <1635507893-25490-2-git-send-email-quic_c_skakit@quicinc.com>
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

Add pm8350c pmic pwm support.

Signed-off-by: satya priya <skakit@codeaurora.org>
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

