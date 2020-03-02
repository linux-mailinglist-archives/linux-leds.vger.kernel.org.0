Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0B2175AFF
	for <lists+linux-leds@lfdr.de>; Mon,  2 Mar 2020 13:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgCBM4a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Mar 2020 07:56:30 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:13708 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727627AbgCBM43 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Mar 2020 07:56:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583153789; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UksUc8DJnc1aYd/SBMqGZD14Ha68l6nAiWZPU19ssZA=; b=kn2NsvxUI1lEFP6vz3AXZ6PFOYIkImBGc80FZrQsMmx0EZXZVDlHxlnHbSEcsVHPdwqRI7Cb
 MsDZ81P+g+q5hRjHp2fEH3eEqqi5LHUHmWWYDt8ZCMf8wss+Nl6d512dqplQ42ufzT1evYAS
 tF2DnL9aiCK/D+e1c15jhh5Nfa0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5d026b.7f9835405500-smtp-out-n01;
 Mon, 02 Mar 2020 12:56:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E655C447A3; Mon,  2 Mar 2020 12:56:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD000C43383;
        Mon,  2 Mar 2020 12:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD000C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 0/2] Add support for WLED5
Date:   Mon,  2 Mar 2020 18:25:36 +0530
Message-Id: <1583153739-19170-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Currently, WLED driver supports only WLED4 peripherals that is present
on pmi8998 and pm660L. This patch series  converts the existing WLED4
bindings from .txt to .yaml format and adds the support for WLED5 peripheral
that is present on PM8150L.

PM8150L WLED supports the following.
    - Two modulators and each sink can use any of the modulator
    - Multiple CABC selection options
    - Multiple brightness width selection (12 bits to 15 bits)

Kiran Gunda (2):
  backlight: qcom-wled: convert the wled bindings to .yaml format
  backlight: qcom-wled: Add support for WLED5 peripheral in PM8150L

 .../bindings/leds/backlight/qcom-wled.txt          | 154 -------
 .../bindings/leds/backlight/qcom-wled.yaml         | 223 ++++++++++
 drivers/video/backlight/qcom-wled.c                | 463 ++++++++++++++++++---
 3 files changed, 636 insertions(+), 204 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
