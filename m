Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34925EBDC9
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2019 07:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbfKAG1b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 1 Nov 2019 02:27:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45170 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbfKAG1b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Nov 2019 02:27:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EB918602F0; Fri,  1 Nov 2019 06:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572589649;
        bh=bL0nOQrP/x3tmqadN/OsJ7Er4EhcsGr3nKsfrJY+8ns=;
        h=From:To:Cc:Subject:Date:From;
        b=WA28TkbYi5W21hY/G1dPTGNxAaPFNPkgjAm5hNzR+dL2//HUUpKRaO6Gk2KEyf21R
         zFE6b+RWYrxCBYDP8SalkIMFeVOIskm9Fqk9Llh7pBxDDab8uk0fLFkIUzhUeD9Gge
         IvM6vn1Keeuxa1fi/iUsp+R+rWSvcZiKqrOTGC6M=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14627602F0;
        Fri,  1 Nov 2019 06:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572589648;
        bh=bL0nOQrP/x3tmqadN/OsJ7Er4EhcsGr3nKsfrJY+8ns=;
        h=From:To:Cc:Subject:Date:From;
        b=MUL7g+74h0Qm/7JuPlbyJhwLkieiNlTfZFnsCa4h1TTmNB6S6pLiifhTvveZrEkFz
         tJz7sAaX+qKPV3DYhwEEqG4bXd9cIKMh3CJq5wyGJphhjz+i/3M1TyYLa0Rca03udg
         cXH8OCKLCGqlm1EdAib4XONUfIfAZJblEHwSTers=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14627602F0
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
Subject: [PATCH V10 0/8] backlight: qcom-wled: Support for QCOM wled driver
Date:   Fri,  1 Nov 2019 11:56:56 +0530
Message-Id: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
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

Changes from v9:
 - Added back the below dropped out patches to this series.
    https://lore.kernel.org/patchwork/patch/1132467/
    https://lore.kernel.org/patchwork/patch/1132468/
 - Added Reviewed-by tag of Daniel Thompson on patch 8

Kiran Gunda (8):
  backlight: qcom-wled: Rename pm8941-wled.c to qcom-wled.c
  backlight: qcom-wled: restructure the qcom-wled bindings.
  backlight: qcom-wled: Add new properties for PMI8998.
  backlight: qcom-wled: Rename PM8941* to WLED3
  backlight: qcom-wled: Restructure the driver for WLED3.
  backlight: qcom-wled: Add support for WLED4 peripheral.
  backlight: qcom-wled: add support for short circuit handling.
  backlight: qcom-wled: Add auto string detection logic

 .../bindings/leds/backlight/pm8941-wled.txt        |   42 -
 .../bindings/leds/backlight/qcom-wled.txt          |  154 +++
 drivers/video/backlight/Kconfig                    |    8 +-
 drivers/video/backlight/Makefile                   |    2 +-
 drivers/video/backlight/pm8941-wled.c              |  424 -------
 drivers/video/backlight/qcom-wled.c                | 1296 ++++++++++++++++++++
 6 files changed, 1455 insertions(+), 471 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/pm8941-wled.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
 delete mode 100644 drivers/video/backlight/pm8941-wled.c
 create mode 100644 drivers/video/backlight/qcom-wled.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

