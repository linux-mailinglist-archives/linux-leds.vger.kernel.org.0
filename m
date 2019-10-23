Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A056BE12B4
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 09:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389633AbfJWHH3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 03:07:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51814 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfJWHH2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 03:07:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C38B760271; Wed, 23 Oct 2019 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571814447;
        bh=RsVQJG+BbPE2D4TxTttitoOCBgg8yT6xV6o3eaZ5zec=;
        h=From:To:Cc:Subject:Date:From;
        b=JhUGHzWXleowBbsDyarOPEj7Zk6htV7vgJL1gefsAPZZuoTU94Br3bGXVutmtKFXM
         OtyQ9cMZsu/ucB+2A/VVUQThqYlBTGCaRjuP27UY6FKLbtLpoH9fUJll4qjuHq3saY
         glDqzJ1ZDoUb4zlxhXDBMqYyQKqQg+uu1+qafEEY=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 042D460271;
        Wed, 23 Oct 2019 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571814446;
        bh=RsVQJG+BbPE2D4TxTttitoOCBgg8yT6xV6o3eaZ5zec=;
        h=From:To:Cc:Subject:Date:From;
        b=AX/XvyaQ4sCeQb3tCmLBAYYXljanSHma00n7UqzT/Uhi2dsFWXIyv5HpAdq2bflnH
         tCUhMqIoQPZYP4aEQY7eKXdK4vVokhWJ7vqdJzFtylX1V4xviYt+6OEXYb+rEH2y0Q
         wKUqwzcyjgCx1Sd7+NDxyvee5/w2W3HEOmIJjQTk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 042D460271
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
Subject: [PATCH V9 0/6] backlight: qcom-wled: Support for QCOM wled driver
Date:   Wed, 23 Oct 2019 12:36:57 +0530
Message-Id: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
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

Changes from v5/v6:
  - Fixed comments from Bjorn/Pavel on V5 series, which were missed in V6 series
  - Patch 1 and 2, mentioned below, from V6 series are picked by Pavel In next.
    Hence, dropped them in this series.
    https://lore.kernel.org/patchwork/patch/1132467/
    https://lore.kernel.org/patchwork/patch/1132468/

Changes from v7:
  - Addressed comments from Daniel Thompson/Lee Jones
  - Patch 1 and 2, mentioned below, from V6 series are picked by Pavel In next.
    Hence, dropped them in this series.
    https://lore.kernel.org/patchwork/patch/1132467/
    https://lore.kernel.org/patchwork/patch/1132468/

Changes from v8:
 - Addressed a comment from Daniel Thompson on patch 6
 - Added Reviewed-by tag of Daniel Thompson on patch 4
 - Patch 1 and 2, mentioned below, from V6 series are picked by Pavel In next.
    Hence, dropped them in this series.
    https://lore.kernel.org/patchwork/patch/1132467/
    https://lore.kernel.org/patchwork/patch/1132468/

Kiran Gunda (6):
  backlight: qcom-wled: Add new properties for PMI8998.
  backlight: qcom-wled: Rename PM8941* to WLED3
  backlight: qcom-wled: Restructure the driver for WLED3.
  backlight: qcom-wled: Add support for WLED4 peripheral.
  backlight: qcom-wled: add support for short circuit handling.
  backlight: qcom-wled: Add auto string detection logic

 .../bindings/leds/backlight/qcom-wled.txt          |   74 +-
 drivers/video/backlight/qcom-wled.c                | 1256 +++++++++++++++++---
 2 files changed, 1127 insertions(+), 203 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

