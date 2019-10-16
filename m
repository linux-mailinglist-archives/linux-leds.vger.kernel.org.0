Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDA3D8D78
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 12:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404529AbfJPKOH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 06:14:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48614 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbfJPKOH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 06:14:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B5144607C3; Wed, 16 Oct 2019 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571220845;
        bh=XJgNG9009diU9oqaJQDCi/V2yYlvtSwWohQ7wEW/wos=;
        h=From:To:Cc:Subject:Date:From;
        b=HYbTuT6/0+LaYGv704o1rsL1nKJPYQETS5poTVDj7m1DAbQuz1ASZTIZiqd/mZj3J
         Ad4Wa2kCyj6MIN11gX+xBR6TsS3+qaehiWcuICCdqGBlVaY74GNtI1aB1YFgjXQg1p
         Fgrl0wGDqXS49rbWwgCoqNto4a8psbry40kDNjV0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8A78601D4;
        Wed, 16 Oct 2019 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571220844;
        bh=XJgNG9009diU9oqaJQDCi/V2yYlvtSwWohQ7wEW/wos=;
        h=From:To:Cc:Subject:Date:From;
        b=fo4cTaF8PfH7j5yLfcxSIWTUyg2oE2u+B1JOfkDObzK6U46gmeohl+J5Fd80hF+uq
         b8+jXQEQ/VY0EQ6FaIHAMbKeYafLAsd3D1Ja0GPP73CN3lHhJClSs5p+SkqRcStm9o
         H6m8774NPSEyYIhxNicvHj/fcaAtvapcEmbOqvKU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8A78601D4
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
Subject: [PATCH V7 0/6] backlight: qcom-wled: Support for QCOM wled driver
Date:   Wed, 16 Oct 2019 15:43:40 +0530
Message-Id: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
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

Kiran Gunda (6):
  backlight: qcom-wled: Add new properties for PMI8998
  backlight: qcom-wled: Rename PM8941* to WLED3.
  backlight: qcom-wled: Restructure the driver for WLED3
  backlight: qcom-wled: Add support for WLED4 peripheral.
  backlight: qcom-wled: add support for short circuit handling.
  backlight: qcom-wled: Add auto string detection logic

 .../bindings/leds/backlight/qcom-wled.txt          |   74 +-
 drivers/video/backlight/qcom-wled.c                | 1256 +++++++++++++++++---
 2 files changed, 1126 insertions(+), 204 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

