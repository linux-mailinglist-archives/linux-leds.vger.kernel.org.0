Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA8D3DC4E6
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jul 2021 10:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhGaIOS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 31 Jul 2021 04:14:18 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:35166 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhGaIOS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 31 Jul 2021 04:14:18 -0400
Received: from localhost (ip-78-45-210-72.net.upcbroadband.cz [78.45.210.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 1FA2840006D;
        Sat, 31 Jul 2021 10:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1627719251;
        bh=pQxc507GhRRD2fUCoDDS/tmv9qvNC6rzTN3gfFEUJ+A=;
        h=From:To:Cc:Subject:Date;
        b=CA2/B2pBhaej5zweBhesrncNCDwbdaEUOY7RQnBegP34mVSNUMZuFQEUGwWNcxQ9w
         ZuM9vMDyLuLYlG4GWn1b+Zve+6MSwg/O5ghtLJkNpLAjr7ESQYoq8tkKJ5OuFAoym2
         VzbS1hcIT1L/n6kGFXq2Ev0yqx62nV7w1yJRx5dq6M/gzNdvi/mf/v0BOQK1iLwygu
         q+92obnX2pkWwmaskGz08h9qbp8fFYcrFuweAJzvC8eDUZ7xG7xIhSmJCElixrl4lk
         FOBYFoO3uOCHi8pOqn/siLJaY/9IV5/5Pe1Y4nhe+YMnDKxQr+Fla1pZtfPF6zFCBo
         GPRlZ9kejZgTg==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     <linux-leds@vger.kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        =?iso-8859-1?Q?Marek_Beh=FAn?= <kabel@kernel.org>
Subject: lp50xx: LED banking appears to be broken
Date:   Sat, 31 Jul 2021 10:14:10 +0200
MIME-Version: 1.0
Message-ID: <d049e22d-5ff8-4a68-a46c-3a1d533afcd0@cesnet.cz>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.15.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi there,
I'm trying to use the LP5009 chip with the following HW setup:

- channels 1-6 drive a big, 20mm LED module which internally consists of=20
six independent LEDs
- channels 7, 8 and 9 drive a RGB LED as usual.

I thought that a DT bindings like this will work:

=09led-controller@0c {
=09=09compatible =3D "ti,lp5009";
=09=09reg =3D <0x0c>;
=09=09#address-cells =3D <1>;
=09=09#size-cells =3D <0>;
=09=09status =3D "okay";

=09=09multi-led@1 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <0>;
=09=09=09reg =3D <1>;
=09=09=09label =3D "tally:1";
=09=09=09led {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09};
=09=09multi-led@2 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <0>;
=09=09=09reg =3D <2>;
=09=09=09label =3D "tally:2";
=09=09=09led {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09};
=09=09multi-led@3 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <0>;
=09=09=09reg =3D <3>;
=09=09=09label =3D "tally:3";
=09=09=09led {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09};
=09=09multi-led@4 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <0>;
=09=09=09reg =3D <4>;
=09=09=09label =3D "tally:4";
=09=09=09led {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09};
=09=09multi-led@5 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <0>;
=09=09=09reg =3D <5>;
=09=09=09label =3D "tally:5";
=09=09=09led {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09};
=09=09multi-led@6 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <0>;
=09=09=09reg =3D <6>;
=09=09=09label =3D "tally:6";
=09=09=09led {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09};

=09=09multi-led@7 {
=09=09=09#address-cells =3D <1>;
=09=09=09#size-cells =3D <2>;
=09=09=09reg =3D <7 8 9>;
=09=09=09color =3D <LED_COLOR_ID_RGB>;
=09=09=09label =3D "preview";

=09=09=09led@7 {
=09=09=09=09color =3D <LED_COLOR_ID_RED>;
=09=09=09};
=09=09=09led@8 {
=09=09=09=09color =3D <LED_COLOR_ID_GREEN>;
=09=09=09};
=09=09=09led@9 {
=09=09=09=09color =3D <LED_COLOR_ID_BLUE>;
=09=09=09};
=09=09};
=09};

This has drawbacks:

- I get a multicolor sysfs entry for each of the six red sub-LEDs, which=20
probably doesn't make much sense. I cannot do a one "multicolor" LED with=20
six channels because there appears to be a limit of 3 channels, and because=20=

the order of channels is documented to be non-deterministic, so that would=20=

require me to come up with fake names or something. Also, driving this from=20=

userspace means two writes for each sub-LED.

- The sysfs entries do not appear to drive correct LEDs. For example, a=20
write to tally:5 or tally:6 results in an error:

 lp50xx 1-000c: Cannot write intensity value -5
 leds tally:6: Setting an LED's brightness failed (-5)

I tried to simplify this, and kept just the one RGB LED (that is, the=20
multi-led@7 and led@7, led@8 and led@9 stanzas). This resulted in the=20
following regmap entries after init:

# cat /sys/kernel/debug/regmap/1-000c/registers=20
00: 40
01: 3c
02: 80
03: ff
04: 0f
05: 0f
06: 0f
07: 0f
08: ff
09: ff
0a: ff
0b: 0f
0c: 00
0d: 00
0e: 00
0f: 00
10: 00
11: 00
12: 00
13: 00
14: 00
15: 00
16: 00
17: ff

Clearly, that's wrong because it sets register's 0x02 reserved bits to=20
non-zero. It looks as if the LED's channel number gets translated to the=20
bank number, which is wrong. There are nine LEDs on LP5009, but only three=20=

individual banks.

Also, I don't think that the concept of "banks" as defined in LP50xx chips=20=

should be used in the Linux driver. The datasheet is not terribly specific=20=

on details, but it looks to me that the "banks" are for a use case where=20
multiple physical LEDs are to, e.g., "breathe together". The chip indeed=20
imposes some limitations when banking is enabled:

- LED0 will always be on channels 1-3. That's incompatible with the current=20=

code which uses the `reg` DT property and allows arbitrary assigning of=20
channels to a LED's color inputs. I can have a Linux RGB LED which uses=20
channels 1, 5 and 9 just fine, but I cannot use banking for that.

- Bank A always drives the first color of all LEDs that have banking=20
enabled. Bank B is always for the second color, and bank C always applies=20
to the third color.

As far as I can tell, there's no support for cross-LED control in Linux, so=20=

I think that we can just rip support for banking from this driver. The main=20=

motivation appears to be saving some I2C bandwidth and MCU cycles. If the=20
driver was serious about this, it would use register auto-increment as a=20
first step I suppose, but the regmap subsystem as-is updates all registers=20=

independently.

Before I send a patch which implements all that, I wanted to ask if I=20
understood everything right, and to check whether these suggestions make=20
sense to the maintainer and to the original author of the driver (and,=20
hopefully, to the users as well).

With kind regards,
Jan
