Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1D7401A09
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 12:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242078AbhIFKnC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Sep 2021 06:43:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23594 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242065AbhIFKnB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Sep 2021 06:43:01 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 03:41:56 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Sep 2021 03:41:54 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Sep 2021 16:11:33 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 307754FA6; Mon,  6 Sep 2021 16:11:32 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 0/3] Add PM8350C PMIC PWM support for backlight
Date:   Mon,  6 Sep 2021 16:11:04 +0530
Message-Id: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series depends on [1], which adds driver for Qualcomm LPG.

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=505483&archive=both&state=*

satya priya (3):
  dt-bindings: leds: Add pm8350c pmic support
  leds: Add pm8350c support to Qualcomm LPG driver
  arm64: dts: qcom: pm8350c: Add pwm support

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml |  1 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi                     |  6 ++++++
 drivers/leds/rgb/leds-qcom-lpg.c                          | 10 ++++++++++
 3 files changed, 17 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

