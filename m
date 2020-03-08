Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363CB17D500
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 17:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgCHQzI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 12:55:08 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:47718 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgCHQzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Mar 2020 12:55:08 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 4ADA5C3EA1; Sun,  8 Mar 2020 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583686505; bh=Cj7AM7tp1yfyr195h4q73qcwcI1tEJ/3UFgq/I7zXfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ke9F0A8eBxAXHPfX3LHDjI6jnhFDAnsp5KR8Qnk6yOaLxVDu8suJ2Ogu80o3Rhd3N
         wlFgVwMffgyLYH/fyU2F9IGRJWuqazWWY4pZ99clkQpZYC4WOK/8YCTYLdOLpJD2Zb
         PuDkBKVKJO8M2MT0ibhA80cYdfYyGZZZUsxt1J0g=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A584CC30A6;
        Sun,  8 Mar 2020 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1583686501; bh=Cj7AM7tp1yfyr195h4q73qcwcI1tEJ/3UFgq/I7zXfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=T1jz3sGKIBnchmVqQ8+oMcHpV1nyIgMct15RtzifIqCZ2UbiZJ02g47hC0L+BHQ8L
         6fa2+TIb7nw23tpwSIo/EoArYnWv/973ooBXw+1EN0o7vBw1gRhE3Vb0AR211exBCr
         XPK6O6/+gF+WpBUIb9k8cli0a2LsOiMzEubJoGs4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
Date:   Sun, 08 Mar 2020 17:55:00 +0100
Message-ID: <1832610.usQuhbGJ8B@g550jk>
In-Reply-To: <b58ddefc-b282-5a85-9dca-824e513705de@gmail.com>
References: <20200227185015.212479-1-luca@z3ntu.xyz> <4539487.31r3eYUQgx@g550jk> <b58ddefc-b282-5a85-9dca-824e513705de@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On Sonntag, 8. M=E4rz 2020 17:47:17 CET Jacek Anaszewski wrote:
> Hi Luca,
>=20
> On 3/8/20 12:32 PM, Luca Weiss wrote:
> > Hi Jacek,
> >=20
> > Thanks for your review! Replies are inline below.
> >=20
> > I'm wondering if I should implement support for the flash-max-timeout-us
> > dt
> > property ("Maximum timeout in microseconds after which the flash LED is
> > turned off.") to configure the timeout to turn the flash off as I've
> > currently hardcoded 250ms but this might not be ideal for all uses of t=
he
> > sgm3140. The datasheet>=20
> > states:
> >> Flash mode is usually used with a pulse of about 200 to 300 millisecon=
ds
> >> to
> >> generate a high intensity Flash.
> >=20
> > so it might be useful to have this configurable in the devicetree. The
> > value of 250ms works fine for my use case.
>=20
> Yeah, I was to mentioned that.
>=20
> > Theoretically also the .timeout_set op could be implemented but I'm not
> > sure if this fits nicely into the existing "timeout" API and if it even
> > makes sense to implement that.
>=20
> Why wouldn't it fit? You can implement timeout_set op and cache flash
> timeout value in it. Then that cached value would be passed in
> strobe_set to mod_timer() in place of currently hard coded 250.
>=20

I'll implement that then.

> > Regards,
> > Luca
> >=20
> > On Donnerstag, 5. M=E4rz 2020 22:09:16 CET Jacek Anaszewski wrote:
> >> Hi Luca,
> >>=20
> >> Thank you for the patch.
> >>=20
> >> On 2/27/20 7:50 PM, Luca Weiss wrote:
> >>> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED drive=
r.
> >>>=20
> >>> This device is controller by two GPIO lines, one for enabling the LED
> >>> and the second one for switching between torch and flash mode.
> >>>=20
> >>> The device will automatically switch to torch mode after being in fla=
sh
> >>> mode for about 250-300ms, so after that time the driver will turn the
> >>> LED off again automatically.
> >>>=20
> >>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> >>> ---
> >>> Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
> >>> in Documentation/leds/leds-class-flash.rst).
> >>>=20
> >>> The following is possible:
> >>>=20
> >>> # Torch on
> >>> echo 1 > /sys/class/leds/white\:flash/brightness
> >>> # Torch off
> >>> echo 0 > /sys/class/leds/white\:flash/brightness
> >>> # Activate flash
> >>> echo 1 > /sys/class/leds/white\:flash/flash_strobe
> >>>=20
> >>> # Torch on
> >>> v4l2-ctl -d /dev/video1 -c led_mode=3D2
> >>> # Torch off
> >>> v4l2-ctl -d /dev/video1 -c led_mode=3D0
> >>> # Activate flash
> >>> v4l2-ctl -d /dev/video1 -c strobe=3D1
> >>=20
> >> What is /dev/video1 ? Did you register vl42 flash subdev
> >> in some v4l2 media controller device?
> >=20
> > On the Allwinner A64 SoC /dev/video0 is the node for cedrus (video
> > encoder/
> > decoder), so the sun6i-csi driver gets to be /dev/video1
> >=20
> > # v4l2-ctl --list-devices
> >=20
> > cedrus (platform:cedrus):
> >         /dev/video0
> >         /dev/media0
> >=20
> > sun6i-csi (platform:csi):
> >         /dev/video1
> >=20
> > Allwinner Video Capture Device (platform:sun6i-csi):
> >         /dev/media1
> >=20
> > Here's the relevant part from my dts:
> >=20
> > sgm3140 {
> >=20
> >     compatible =3D "sgmicro,sgm3140";
> >     flash-gpios =3D <&pio 3 24 GPIO_ACTIVE_HIGH>; /* FLASH_TRIGOUT: PD2=
4 */
> >     enable-gpios =3D <&pio 2 3 GPIO_ACTIVE_HIGH>; /* FLASH_EN: PC3 */
> >    =20
> >     sgm3140_flash: led {
> >    =20
> >         function =3D LED_FUNCTION_FLASH;
> >         color =3D <LED_COLOR_ID_WHITE>;
> >    =20
> >     };
> >=20
> > };
>=20
> This needs to be documented in DT bindings for this driver.
>=20

I have already written some yesterday, will post them with my v1 :)

> > /* as subnode of csi (compatible: allwinner,sun50i-a64-csi) */
> > ov5640: rear-camera@4c {
> >=20
> >     compatible =3D "ovti,ov5640";
> >     <snip>
> >     flash-leds =3D <&sgm3140_flash>;
> >=20
> > };
>=20
> And this in camera bindings.

This is documented at=20
Documentation/devicetree/bindings/media/video-interfaces.txt:

=2D flash-leds: An array of phandles, each referring to a flash LED, a sub-=
node
  of the LED driver device node.

Without referencing the flash device in a camera node, the v4l2 controls wo=
n't=20
even show up from what I saw.
The binding is apparently only used in omap3-n9 and omap3-n950 currently; o=
nly=20
phones have flash leds normally and the phones that are currently in mainli=
ne=20
Linux don't have camera support yet.

Regards
Luca


