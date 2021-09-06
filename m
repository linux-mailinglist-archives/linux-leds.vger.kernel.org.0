Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B34401A0B
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 12:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242082AbhIFKnC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Sep 2021 06:43:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23594 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242076AbhIFKnB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Sep 2021 06:43:01 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 03:41:56 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Sep 2021 03:41:54 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Sep 2021 16:11:33 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 42D65B1C; Mon,  6 Sep 2021 16:11:32 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 1/3] dt-bindings: leds: Add pm8350c pmic support
Date:   Mon,  6 Sep 2021 16:11:05 +0530
Message-Id: <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add pm8350c pmic pwm support.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 10aee61..56d7a39 100644
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

