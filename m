Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F28303FB5
	for <lists+linux-leds@lfdr.de>; Tue, 26 Jan 2021 15:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405704AbhAZOHf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 09:07:35 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:16953 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392713AbhAZOHN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 09:07:13 -0500
Date:   Tue, 26 Jan 2021 14:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611669988;
        bh=xmb8JiMZ0qx9ONDljEb7E5aB5mcbUdJjKenPUDfOyPQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=uUFWznkp8eoW+NjmZWxGUqIaeWNxq03xsZtc+3vb/Wq/S9qz91T50bTpBlWOes7Bz
         lgr5ZmTZrdZsq9XHyEn4r/QA4ZNz8i78DyX/dB5kH8CYIjW/XcOWnCKEE2D/MKsJkm
         gCxLig/uHPh4dvcoNt2mviYnZwgDQT+CZWmuqunI=
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH v2 3/4] ARM: qcom_defconfig: Enable QCOM SPMI Flash LEDs
Message-ID: <20210126140240.1517044-4-nfraprado@protonmail.com>
In-Reply-To: <20210126140240.1517044-1-nfraprado@protonmail.com>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Enable module for the Qualcomm SPMI Flash LEDs present on the PM8941
PMIC.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
Changes in v2:
- Enabled CONFIG_LEDS_CLASS_FLASH since the driver now depends on it.

 arch/arm/configs/qcom_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defcon=
fig
index f6e9675f639c..05cacc59087e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -202,6 +202,7 @@ CONFIG_MMC_SDHCI_PLTFM=3Dy
 CONFIG_MMC_SDHCI_MSM=3Dy
 CONFIG_NEW_LEDS=3Dy
 CONFIG_LEDS_CLASS=3Dy
+CONFIG_LEDS_CLASS_FLASH=3Dy
 CONFIG_LEDS_GPIO=3Dy
 CONFIG_LEDS_PM8058=3Dy
 CONFIG_LEDS_TRIGGERS=3Dy
@@ -284,3 +285,4 @@ CONFIG_DYNAMIC_DEBUG=3Dy
 CONFIG_DEBUG_INFO=3Dy
 CONFIG_MAGIC_SYSRQ=3Dy
 # CONFIG_SCHED_DEBUG is not set
+CONFIG_LEDS_QCOM_SPMI_FLASH=3Dm
--=20
2.30.0


