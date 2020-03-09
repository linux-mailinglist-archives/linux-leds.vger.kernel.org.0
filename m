Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5549917E10B
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 14:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgCIN0t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 09:26:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:49577 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726536AbgCIN0t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2020 09:26:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583760408; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=D+vuyGCUCzEM9aL20B90w5AoCxN08RN5QuMYygPRkqs=; b=jXpSIUeWAjcnU6f9Yr/oLM+ZhlWoLWkatFpQOwXMh8MyQmI5A/pxcodHenOyNreuFcPNdErE
 QltmSxQLzZXI9MWEcnf1yrw5VHdjVT2Elpnb8NlQlpP/ABXt33s225FGcncJHkwMOCnnoKT3
 7XrIGYoFJgQsMp/BsGUsMVIMk9U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e66440a.7fea38d5ae30-smtp-out-n04;
 Mon, 09 Mar 2020 13:26:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DC59C4478F; Mon,  9 Mar 2020 13:26:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F3D0C43637;
        Mon,  9 Mar 2020 13:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F3D0C43637
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
Subject: [PATCH V3 0/4] Add support for WLED5
Date:   Mon,  9 Mar 2020 18:55:58 +0530
Message-Id: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
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

Changes from V1:
	- Rebased on top of the below commit.
	  backlight: qcom-wled: Fix unsigned comparison to zero

Changes from V2:
	- Addressed Bjorn's comments by splitting the WLED4 changes
	  in a seperate patch.
	- Added WLED5 auto calibration support

Kiran Gunda (4):
  backlight: qcom-wled: convert the wled bindings to .yaml format
  backlight: qcom-wled: Add callbacks functions
  backlight: qcom-wled: Add support for WLED5 peripheral in PM8150L
  backlight: qcom-wled: Update auto calibration support for WLED5

 .../bindings/leds/backlight/qcom-wled.txt          | 154 -----
 .../bindings/leds/backlight/qcom-wled.yaml         | 223 ++++++++
 drivers/video/backlight/qcom-wled.c                | 622 ++++++++++++++++++---
 3 files changed, 772 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
