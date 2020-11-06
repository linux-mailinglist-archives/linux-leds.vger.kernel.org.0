Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD872A9A11
	for <lists+linux-leds@lfdr.de>; Fri,  6 Nov 2020 17:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgKFQ7K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Nov 2020 11:59:10 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:39246 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbgKFQ7K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Nov 2020 11:59:10 -0500
Date:   Fri, 06 Nov 2020 16:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1604681946;
        bh=8Ihqa5Vvsl+pEyKvgWY7ob9c1vmwPKqugyKLjs3nk08=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=r53HIWuW1ALhT+j6NepG6g3lu3uihJ3b549sgIfDgEQ12yn+dtNQ769adFRMQe0AH
         7nZFqr98B17ICWb3PpAowoLdnkPcmJa6UIECZYjWdM3kNBKkX/+EuuunBnNnYAEUVK
         /+frLfMnSrs8LqKIs4abaLEutU0Qbv8kcsewQ/mo=
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
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [RFC PATCH 2/3] ARM: qcom_defconfig: Add QPNP flash LED support
Message-ID: <20201106165737.1029106-3-nfraprado@protonmail.com>
In-Reply-To: <20201106165737.1029106-1-nfraprado@protonmail.com>
References: <20201106165737.1029106-1-nfraprado@protonmail.com>
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

Add support for the flash LED on msm8974 devices, like the Nexus 5.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defcon=
fig
index e1c65a8dd2af..19934d92e3a7 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -284,3 +284,4 @@ CONFIG_DYNAMIC_DEBUG=3Dy
 CONFIG_DEBUG_INFO=3Dy
 CONFIG_MAGIC_SYSRQ=3Dy
 # CONFIG_SCHED_DEBUG is not set
+CONFIG_LEDS_QPNP=3Dm
--=20
2.29.2


