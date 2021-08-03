Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6B13DF27D
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 18:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhHCQ1e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 12:27:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51932 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbhHCQ1c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 12:27:32 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 527AC1F423F0;
        Tue,  3 Aug 2021 17:27:15 +0100 (BST)
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 3/5] ARM: qcom_defconfig: Enable QCOM SPMI Flash LEDs
Date:   Tue,  3 Aug 2021 13:26:39 -0300
Message-Id: <20210803162641.1525980-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803162641.1525980-1-nfraprado@collabora.com>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Enable module for the Qualcomm SPMI Flash LEDs present on the PM8941
PMIC. These LEDs are used on phones based on the MSM8974 SoC like the
Nexus 5.

Also enable LED flash class since these LEDs make use of it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

Changes in v3:
- Made CONFIG_LEDS_CLASS_FLASH =m

Changes in v2:
- Enabled CONFIG_LEDS_CLASS_FLASH since the driver now depends on it.

 arch/arm/configs/qcom_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 9c286861a9c0..1be619a12637 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -206,6 +206,7 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_MSM=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_FLASH=m
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PM8058=y
 CONFIG_LEDS_TRIGGERS=y
@@ -308,3 +309,4 @@ CONFIG_QCOM_WDT=y
 CONFIG_ARM_PSCI=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
+CONFIG_LEDS_QCOM_SPMI_FLASH=m
-- 
2.32.0

