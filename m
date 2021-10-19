Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96634333E5
	for <lists+linux-leds@lfdr.de>; Tue, 19 Oct 2021 12:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235318AbhJSKvl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Oct 2021 06:51:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46252 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhJSKvk (ORCPT
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
        id 44256294E; Tue, 19 Oct 2021 16:19:08 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, swboyd@chromium.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 1/3] dt-bindings: leds: Add pm8350c pmic support
Date:   Tue, 19 Oct 2021 16:18:49 +0530
Message-Id: <1634640531-15813-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634640531-15813-1-git-send-email-skakit@codeaurora.org>
References: <1634640531-15813-1-git-send-email-skakit@codeaurora.org>
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
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

