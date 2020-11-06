Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0382A2A9A18
	for <lists+linux-leds@lfdr.de>; Fri,  6 Nov 2020 18:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgKFQ7g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Nov 2020 11:59:36 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:42956 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727471AbgKFQ7g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Nov 2020 11:59:36 -0500
Date:   Fri, 06 Nov 2020 16:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1604681973;
        bh=q97hEjceJ6nbr48yC1m9U9+JpJMDG+nd0Pgn/ZWOkHg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qMeyAQs3016EjEm8+8afwGko2JDjXVjtutZRDvrkddw6psMsdsBhnN0kOCCl1hzD2
         FcfrYpWSOJKbyjwZszVJIO46QphTJd0EZe1K1n9YzW3Bht7N3Mtyvxoe4ITAL/D9SP
         R8FECoADFH5JEnebigG6XUmU9JUO044m29p7SAe4=
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
Subject: [RFC PATCH 3/3] ARM: dts: qcom: msm8974-hammerhead: Add support for the flash LED
Message-ID: <20201106165737.1029106-4-nfraprado@protonmail.com>
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

Add the necessary device tree nodes for the flash LED.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arc=
h/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 32b474bfeec3..6aa93c236178 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -730,4 +730,60 @@ otg {
 =09=09=09};
 =09=09};
 =09};
+=09pm8941@1 {
+=09=09qcom,leds@d300 {
+=09=09=09status =3D "ok";
+
+=09=09=09compatible =3D "qcom,leds-qpnp";
+=09=09=09reg =3D <0xd300 0x100>;
+=09=09=09label =3D "flash";
+=09=09=09flash-boost-supply =3D <&pm8941_5vs1>;
+=09=09=09torch-boost-supply =3D <&pm8941_5v>;
+=09=09=09pm8941_flash0: qcom,flash_0 {
+=09=09=09=09qcom,max-current =3D <1000>;
+=09=09=09=09qcom,default-state =3D "off";
+=09=09=09=09qcom,headroom =3D <3>;
+=09=09=09=09qcom,duration =3D <1280>;
+=09=09=09=09qcom,clamp-curr =3D <200>;
+=09=09=09=09qcom,startup-dly =3D <3>;
+=09=09=09=09qcom,safety-timer;
+=09=09=09=09label =3D "flash";
+=09=09=09=09linux,default-trigger =3D
+=09=09=09=09=09"flash0_trigger";
+=09=09=09=09qcom,id =3D <1>;
+=09=09=09=09linux,name =3D "led:flash_0";
+=09=09=09=09qcom,current =3D <620>;
+=09=09=09};
+
+=09=09=09pm8941_flash1: qcom,flash_1 {
+=09=09=09=09qcom,max-current =3D <1000>;
+=09=09=09=09qcom,default-state =3D "off";
+=09=09=09=09qcom,headroom =3D <3>;
+=09=09=09=09qcom,duration =3D <1280>;
+=09=09=09=09qcom,clamp-curr =3D <200>;
+=09=09=09=09qcom,startup-dly =3D <3>;
+=09=09=09=09qcom,safety-timer;
+=09=09=09=09linux,default-trigger =3D
+=09=09=09=09=09"flash1_trigger";
+=09=09=09=09label =3D "flash";
+=09=09=09=09qcom,id =3D <2>;
+=09=09=09=09linux,name =3D "led:flash_1";
+=09=09=09=09qcom,current =3D <620>;
+=09=09=09};
+
+=09=09=09pm8941_torch: qcom,flash_torch {
+=09=09=09=09qcom,max-current =3D <200>;
+=09=09=09=09qcom,default-state =3D "off";
+=09=09=09=09qcom,headroom =3D <0>;
+=09=09=09=09qcom,startup-dly =3D <1>;
+=09=09=09=09linux,default-trigger =3D
+=09=09=09=09=09"torch_trigger";
+=09=09=09=09label =3D "flash";
+=09=09=09=09qcom,id =3D <2>;
+=09=09=09=09linux,name =3D "led:flash_torch";
+=09=09=09=09qcom,current =3D <90>;
+=09=09=09=09qcom,torch-enable;
+=09=09=09};
+=09=09};
+=09};
 };
--=20
2.29.2


