Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8EB45EA14
	for <lists+linux-leds@lfdr.de>; Fri, 26 Nov 2021 10:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhKZJRq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Nov 2021 04:17:46 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56911 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359869AbhKZJPp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Nov 2021 04:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637917953; x=1669453953;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=PS2FXnoKIrtw2yYqfrIdjlvWzIezv/Lw3Ha7Y6u0dfk=;
  b=YvRwGgLEdvMOUQVFd5ONmuLhYp5Mi7vQbGL0EWPLbqYUdkcX2Sr3KWn7
   sWTw+jUBh/+gpcbZhy6bfxe3GjEfOG3khOWuqy+KASsEU8gkf7pjMsh3q
   kKwavERdfVyipp0MVQwYZWhFy+BsmX6aRr5wZNbrbzmzcBMDrCksj0UAE
   A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Nov 2021 01:12:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 01:12:31 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:31 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 26 Nov 2021 01:12:28 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <quic_tsoni@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [RESEND PATCH V3 0/4] Add PM8350C PMIC PWM support for backlight
Date:   Fri, 26 Nov 2021 14:41:56 +0530
Message-ID: <1637917920-22041-1-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

I'm resending this version after correcting SOB.

This series depends on [1], which adds driver for Qualcomm LPG.

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=560587&state=%2A&archive=both

Satya Priya (1):
  arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2
  dt-bindings: leds: Add pm8350c pmic support
  leds: Add pm8350c support to Qualcomm LPG driver
  arm64: dts: qcom: pm8350c: Add pwm support

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml |  1 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi                     |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts                  |  4 ++++
 drivers/leds/rgb/leds-qcom-lpg.c                          | 13 +++++++++++++
 4 files changed, 25 insertions(+)

-- 
2.7.4

