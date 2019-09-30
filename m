Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9298FC1B82
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2019 08:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729677AbfI3Gjo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Sep 2019 02:39:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41624 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729592AbfI3Gjo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 30 Sep 2019 02:39:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8465B607C6; Mon, 30 Sep 2019 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569825583;
        bh=1qNHkkMgT5hOVnMaCbUcCEui91XvPTn+kZXRkbNHc+k=;
        h=From:To:Cc:Subject:Date:From;
        b=huMiW61BVsCUMAkoP3y5OaUnFMNRWpEI4FQUK2x+wPP+bBIwNXvjLjKoUWi8Lw3ho
         T4PaP5xtfSP8SW2nj9OA4HcxMLZj2GRyvbgvGN2toAPIdDdIPkjjin9fI1ehq4RMLU
         PBd2sFkmqaBSm5J5LBeeMSC6Vj3nFyCOV6HjaG64=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B194B607C6;
        Mon, 30 Sep 2019 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569825582;
        bh=1qNHkkMgT5hOVnMaCbUcCEui91XvPTn+kZXRkbNHc+k=;
        h=From:To:Cc:Subject:Date:From;
        b=IocXLNUscTjCpb7jNz63MVrifS6OV5AVVG/N40oq5zr9krX4zrRgajXNI9TvUiMMQ
         uCWX1rpSJ52FpOv9H7X7suUwgk5ZgUNnQFk1nPIXNlAZwpprZEiCXcD04di5qK26pU
         C51PD7HRZW0IA5X/lCpu9TgY/LNIdLMwO1BXDh1Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B194B607C6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V6 0/8] backlight: qcom-wled: Support for QCOM wled driver
Date:   Mon, 30 Sep 2019 12:09:05 +0530
Message-Id: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series renames the pm8941-wled.c driver to qcom-wled.c to add
the support for multiple PMICs supported by qualcomm. This patch series
supports both PM8941 and PMI8998 WLED. The PMI8998 WLED has the support
to handle the OVP (over voltage protection) and the SC (short circuit
protection)
interrupts. It also has the auto string detection algorithm support to
configure the right strings if the user specified string configuration
is in-correct. These three features are added in this series for PMI8998.

changes from v1:
   - Fixed the commit message for
   - backlight: qcom-wled: Rename pm8941-wled.c to qcom-wled.c

Changes from v2:
   - Fixed bjorn and other reviewer's comments
   - Seperated the device tree bindings
   - Splitted out the WLED4 changes in seperate patch
   - Merged OVP and auto string detection patch

Changes from v3:
  - Added Reviewed-by/Acked-by tags
  - Fixed comments from Bjorn/Vinod/Rob
  - Splitting the "backlight: qcom-wled: Add support for WLED4 peripheral" patch
    to seperate the WLED3 specific restructure.

Changes from v4:
  - Added reviewed-by/Acked-by tags
  - Fixed comments from Bjorn/Daniel/Pavel

Changes from v5:
  - Fixed comments from Bjorn/Pavel

Kiran Gunda (8):
  backlight: qcom-wled: Rename pm8941-wled.c to qcom-wled.c
  backlight: qcom-wled: restructure the qcom-wled bindings
  backlight: qcom-wled: Add new properties for PMI8998
  backlight: qcom-wled: Rename PM8941* to WLED3
  backlight: qcom-wled: Restructure the driver for WLED3
  backlight: qcom-wled: Add support for WLED4 peripheral
  backlight: qcom-wled: add support for short circuit handling.
  backlight: qcom-wled: Add auto string detection logic

 .../bindings/leds/backlight/pm8941-wled.txt        |   42 -
 .../bindings/leds/backlight/qcom-wled.txt          |  150 +++
 drivers/video/backlight/Kconfig                    |    8 +-
 drivers/video/backlight/Makefile                   |    2 +-
 drivers/video/backlight/pm8941-wled.c              |  424 -------
 drivers/video/backlight/qcom-wled.c                | 1288 ++++++++++++++++++++
 6 files changed, 1443 insertions(+), 471 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 delete mode 100644 drivers/video/backlight/pm8941-wled.c
 create mode 100644 drivers/video/backlight/qcom-wled.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

