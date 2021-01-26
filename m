Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DA3303FC0
	for <lists+linux-leds@lfdr.de>; Tue, 26 Jan 2021 15:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405570AbhAZOI6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 09:08:58 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:58828 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405745AbhAZOIg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 09:08:36 -0500
Date:   Tue, 26 Jan 2021 14:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611670025;
        bh=salyD/WHDIurAfXLaRdlHjy/N3gO/EgJ38mXhbWj+8A=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=q+HTsB7Uqut7TDSqzeqkeRLfypg5t9zC4sq5LSGRFXYLjJ4ngWqoirWhUky/juxGQ
         rN7eNCEZGezvPUctVw4/tc5Rbg+bY8AbpHw33S4jL4mdDogThy2JFU+eLWJNfBLAma
         fJu7BQd7ZQmcn9HjcaXfniqfIEedKnoIcXypjjEw=
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
Subject: [PATCH v2 4/4] ARM: dts: qcom: pm8941: Add nodes for QCOM SPMI Flash LEDs
Message-ID: <20210126140240.1517044-5-nfraprado@protonmail.com>
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

Add the necessary devicetree nodes for the Qualcomm SPMI Flash LEDs
present in PM8941.

Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
---
Changes in v2:
- Moved from hammerhead dts to pm8941 dtsi, as it was this way downstream
- Now using values from leds-qcom-spmi-flash.h

 arch/arm/boot/dts/qcom-pm8941.dtsi | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm=
8941.dtsi
index c1f2012d1c8b..89309d3c777c 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -2,6 +2,8 @@
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/leds/leds-qcom-spmi-flash.h>
=20
 &spmi_bus {
=20
@@ -189,5 +191,41 @@ pm8941_5vs2: 5vs2 {
 =09=09=09=09regulator-initial-mode =3D <1>;
 =09=09=09};
 =09=09};
+
+=09=09qcom,spmi-flash@d300 {
+=09=09=09status =3D "okay";
+
+=09=09=09compatible =3D "qcom,spmi-flash";
+=09=09=09reg =3D <0xd300 0x100>;
+=09=09=09flash-boost-supply =3D <&pm8941_5vs1>;
+=09=09=09torch-boost-supply =3D <&pm8941_5v>;
+=09=09=09pm8941_flash0: led0 {
+=09=09=09=09led-sources =3D <0>;
+=09=09=09=09function =3D LED_FUNCTION_FLASH;
+=09=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09=09led-max-microamp =3D <200000>;
+=09=09=09=09flash-max-microamp =3D <1000000>;
+=09=09=09=09flash-max-timeout-us =3D <1280000>;
+=09=09=09=09default-state =3D "off";
+=09=09=09=09qcom,clamp-curr =3D <200000>;
+=09=09=09=09qcom,headroom =3D <QCOM_SPMI_FLASH_HEADROOM_500MV>;
+=09=09=09=09qcom,startup-dly =3D <QCOM_SPMI_FLASH_STARTUP_DLY_128US>;
+=09=09=09=09qcom,safety-timer;
+=09=09=09};
+
+=09=09=09pm8941_flash1: led1 {
+=09=09=09=09led-sources =3D <1>;
+=09=09=09=09function =3D LED_FUNCTION_FLASH;
+=09=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09=09led-max-microamp =3D <200000>;
+=09=09=09=09flash-max-microamp =3D <1000000>;
+=09=09=09=09flash-max-timeout-us =3D <1280000>;
+=09=09=09=09default-state =3D "off";
+=09=09=09=09qcom,clamp-curr =3D <200000>;
+=09=09=09=09qcom,headroom =3D <QCOM_SPMI_FLASH_HEADROOM_500MV>;
+=09=09=09=09qcom,startup-dly =3D <QCOM_SPMI_FLASH_STARTUP_DLY_128US>;
+=09=09=09=09qcom,safety-timer;
+=09=09=09};
+=09=09};
 =09};
 };
--=20
2.30.0


