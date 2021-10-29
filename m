Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61C843FBA1
	for <lists+linux-leds@lfdr.de>; Fri, 29 Oct 2021 13:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhJ2Lrr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 29 Oct 2021 07:47:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11457 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhJ2Lrq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 29 Oct 2021 07:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635507918; x=1667043918;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=E5Oi1K3kkRiAM71vuOqErVhZeeiDouXckBeZRHGiwKA=;
  b=BAupIeHwEtW5siaRSxsP6+hO4PUWAPhmQbOXvFud34x1JLcjBlTW4EfB
   vTufZd/xmEiIBTOjD7xy8r4ZsQ1vO0zjUKMpV0OyCronyaesfmhhnu3+m
   wUW1zHNwORIF5WgF4HYnnsezJpiOeS2NSICUYziHZMGAUDHdhyU4iP595
   k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 29 Oct 2021 04:45:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 04:45:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:16 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 04:45:13 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <mka@chromium.org>, <swboyd@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V3 0/4] Add PM8350C PMIC PWM support for backlight
Date:   Fri, 29 Oct 2021 17:14:49 +0530
Message-ID: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series depends on [1], which adds driver for Qualcomm LPG.

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=560587&state=%2A&archive=both

Satya Priya (1):
  arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2

satya priya (3):
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

