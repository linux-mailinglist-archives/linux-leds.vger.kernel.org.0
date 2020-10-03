Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D93528242E
	for <lists+linux-leds@lfdr.de>; Sat,  3 Oct 2020 15:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgJCNCy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Oct 2020 09:02:54 -0400
Received: from w1.tutanota.de ([81.3.6.162]:55186 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgJCNCy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 3 Oct 2020 09:02:54 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 43562FBB3C4;
        Sat,  3 Oct 2020 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601730171;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
        bh=Besfj0fOCRqALJInWSMpcsdiy7HYpFGUL4/rb5FgECM=;
        b=N7v5B2GZ8gk0R/K0JxOxS9cMckDTvLhYUi2MjDHMpGTFBdrWuKwYU7UsLi25KIUi
        xfKG9WK7fLcBxOpGQQdrGhc/yBZ4SyW2RiSR/UOhV2adZDsLTk/KeDMZZ95gPS1DOfZ
        hmBhD6LL8SudXBKatQkivanrqhIYHh1fF4aGCkvzN6mJswU8CXltUozvF+QBGu3bTnR
        1lLzbYPD7w94IcRb/TbBzq5dvE1rbdqfNCkSxgck/95a7Wl/NnGEN/AixZ2Uq0DxHMe
        2kLqNRx5qu5RUjlEfkS3E8y5mJGlkMml6loCduQb13oTP2ZamHyf/aZOYbveCFJtgqX
        ffekkOoDXg==
Date:   Sat, 3 Oct 2020 15:02:51 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>
Cc:     Linux Leds <linux-leds@vger.kernel.org>,
        Trivial <trivial@kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <MIiYgay--3-2@tutanota.com>
Subject:  [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: multipart/mixed; 
        boundary="----=_Part_34263_1921544507.1601730171258"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

------=_Part_34263_1921544507.1601730171258
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ultracoolguy <ultracoolguy@tutanota.com>
Hi, all. This is a patch fixing an out-of-bounds error due to lm3697_init e=
xpecting the device tree to use both control banks.=C2=A0 This fixes it by =
adding a new variable that will hold the number of used banks.

Panic caused by this bug:

<1>[=C2=A0=C2=A0=C2=A0 3.059763] Unable to handle kernel NULL pointer deref=
erence at virtual address 00000000000001e5
<1>[=C2=A0=C2=A0=C2=A0 3.059779] Mem abort info:
<1>[=C2=A0=C2=A0=C2=A0 3.059788]=C2=A0=C2=A0 ESR =3D 0x96000004
<1>[=C2=A0=C2=A0=C2=A0 3.059799]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL)=
, IL =3D 32 bits
<1>[=C2=A0=C2=A0=C2=A0 3.059807]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
<1>[=C2=A0=C2=A0=C2=A0 3.059816]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
<1>[=C2=A0=C2=A0=C2=A0 3.059824] Data abort info:
<1>[=C2=A0=C2=A0=C2=A0 3.059833]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004
<1>[=C2=A0=C2=A0=C2=A0 3.059841]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0
<1>[=C2=A0=C2=A0=C2=A0 3.059850] [00000000000001e5] user address but active=
_mm is swapper
<0>[=C2=A0=C2=A0=C2=A0 3.059864] Internal error: Oops: 96000004 [#1] PREEMP=
T SMP
<7>[=C2=A0=C2=A0=C2=A0 3.059874] Modules linked in:
<7>[=C2=A0=C2=A0=C2=A0 3.059893] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 5.9.0-rc7-postmarketos-qcom-msm8953 #71
<7>[=C2=A0=C2=A0=C2=A0 3.059903] Hardware name: Motorola G7 Power (ocean) (=
DT)
<7>[=C2=A0=C2=A0=C2=A0 3.059916] pstate: a0000005 (NzCv daif -PAN -UAO BTYP=
E=3D--)
<7>[=C2=A0=C2=A0=C2=A0 3.059937] pc : regmap_write+0x1c/0x78
<7>[=C2=A0=C2=A0=C2=A0 3.059952] lr : ti_lmu_common_set_ramp+0x60/0x70
<7>[=C2=A0=C2=A0=C2=A0 3.059961] sp : ffff800010043ad0
<7>[=C2=A0=C2=A0=C2=A0 3.059970] x29: ffff800010043ad0 x28: ffff0000b98510d=
0=20
 <7>[=C2=A0=C2=A0=C2=A0 3.059982] x27: ffff0000b9851288 x26: ffff800010906c=
c0=20
<7>[=C2=A0=C2=A0=C2=A0 3.059995] x25: ffff8000108e5d85 x24: 000000000000000=
1=20
<7>[=C2=A0=C2=A0=C2=A0 3.060008] x23: 0000000000000000 x22: ffff0000b985108=
0=20
<7>[=C2=A0=C2=A0=C2=A0 3.060020] x21: 0000000000000001 x20: 000000000000000=
f=20
<7>[=C2=A0=C2=A0=C2=A0 3.060032] x19: 0000000000000001 x18: 000000000000000=
0=20
<7>[=C2=A0=C2=A0=C2=A0 3.060045] x17: 00000000f2f3902a x16: 00000000ee02cbf=
b=20
<7>[=C2=A0=C2=A0=C2=A0 3.060058] x15: 000000000000000a x14: 000000000000030=
7=20
<7>[=C2=A0=C2=A0=C2=A0 3.060070] x13: ffffffffffffffff x12: fffffffffffffff=
f=20
<7>[=C2=A0=C2=A0=C2=A0 3.060083] x11: 0000000000000000 x10: 000000000000095=
0=20
<7>[=C2=A0=C2=A0=C2=A0 3.060095] x9 : ffff8000105864e4 x8 : ffff0000b2f089b=
0=20
<7>[=C2=A0=C2=A0=C2=A0 3.060108] x7 : 0000000000000004 x6 : 000000000000033=
c=20
<7>[=C2=A0=C2=A0=C2=A0 3.060120] x5 : ffff0000b98c51d0 x4 : 000000000000000=
0=20
<7>[=C2=A0=C2=A0=C2=A0 3.060132] x3 : ffff0000b2f08000 x2 : 00000000000000f=
f=20
<7>[=C2=A0=C2=A0=C2=A0 3.060145] x1 : 0000000000000000 x0 : 000000000000000=
1
<7>[=C2=A0=C2=A0=C2=A0 3.060158] Call trace:
<7>[=C2=A0=C2=A0=C2=A0 3.060172]=C2=A0 regmap_write+0x1c/0x78
<7>[=C2=A0=C2=A0=C2=A0 3.060183]=C2=A0 ti_lmu_common_set_ramp+0x60/0x70
<7>[=C2=A0=C2=A0=C2=A0 3.060195]=C2=A0 lm3697_probe+0x4d4/0x534
<7>[=C2=A0=C2=A0=C2=A0 3.060211]=C2=A0 i2c_device_probe+0x22c/0x294
<7>[=C2=A0=C2=A0=C2=A0 3.060225]=C2=A0 really_probe+0x1e0/0x468
<7>[=C2=A0=C2=A0=C2=A0 3.060237]=C2=A0 driver_probe_device+0xfc/0x140
<7>[=C2=A0=C2=A0=C2=A0 3.060250]=C2=A0 device_driver_attach+0x48/0x70
<7>[=C2=A0=C2=A0=C2=A0 3.060262]=C2=A0 __driver_attach+0x134/0x14c
<7>[=C2=A0=C2=A0=C2=A0 3.060275]=C2=A0 bus_for_each_dev+0x64/0xbc
<7>[=C2=A0=C2=A0=C2=A0 3.060287]=C2=A0 driver_attach+0x28/0x30
<7>[=C2=A0=C2=A0=C2=A0 3.060299]=C2=A0 bus_add_driver+0x110/0x1fc
<7>[=C2=A0=C2=A0=C2=A0 3.060312]=C2=A0 driver_register+0xa8/0xec
<7>[=C2=A0=C2=A0=C2=A0 3.060325]=C2=A0 i2c_register_driver+0x94/0xac
<7>[=C2=A0=C2=A0=C2=A0 3.060341]=C2=A0 lm3697_driver_init+0x20/0x28
<7>[=C2=A0=C2=A0=C2=A0 3.060356]=C2=A0 do_one_initcall+0xc4/0x228
<7>[=C2=A0=C2=A0=C2=A0 3.060368]=C2=A0 kernel_init_freeable+0x1e4/0x24c
<7>[=C2=A0=C2=A0=C2=A0 3.060384]=C2=A0 kernel_init+0x18/0x110
<7>[=C2=A0=C2=A0=C2=A0 3.060397]=C2=A0 ret_from_fork+0x10/0x18
<0>[=C2=A0=C2=A0=C2=A0 3.060415] Code: 910003fd a90153f3 aa0003f3 f90013f5 =
(b941e400)=20
<4>[=C2=A0=C2=A0=C2=A0 3.060439] ---[ end trace fcc24bd799273148 ]---


------=_Part_34263_1921544507.1601730171258
Content-Type: text/x-patch; charset=us-ascii; 
	name=0001-leds-lm3697-Fix-out-of-bound-access.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-leds-lm3697-Fix-out-of-bound-access.patch

From 0dfd5ab647ccbc585c543d702b44d20f0e3fe436 Mon Sep 17 00:00:00 2001
From: Ultracoolguy <ultracoolguy@tutanota.com>
Date: Fri, 2 Oct 2020 18:27:00 -0400
Subject: [PATCH] leds:lm3697:Fix out-of-bound access

If both led banks aren't used in device tree,
an out-of-bounds condition in lm3697_init occurs
because of the for loop assuming that all the banks are used.
Fix it by adding a variable that contains the number of used banks.

Signed-off-by: Ultracoolguy <ultracoolguy@tutanota.com>
---
 drivers/leds/leds-lm3697.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 024983088d59..a4ec2b6077e6 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -56,7 +56,7 @@ struct lm3697_led {
 	struct ti_lmu_bank lmu_data;
 	int control_bank;
 	int enabled;
-	int num_leds;
+	int num_led_strings;
 };

 /**
@@ -78,6 +78,7 @@ struct lm3697 {
 	struct mutex lock;

 	int bank_cfg;
+	int num_leds;

 	struct lm3697_led leds[];
 };
@@ -180,7 +181,7 @@ static int lm3697_init(struct lm3697 *priv)
 	if (ret)
 		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");

-	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
+	for (i = 0; i < priv->num_leds; i++) {
 		led = &priv->leds[i];
 		ret = ti_lmu_common_set_ramp(&led->lmu_data);
 		if (ret)
@@ -244,22 +245,22 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
 						   led->control_bank * 2;

-		led->num_leds = fwnode_property_count_u32(child, "led-sources");
-		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
+		led->num_led_strings = fwnode_property_count_u32(child, "led-sources");
+		if (led->num_led_strings > LM3697_MAX_LED_STRINGS) {
 			dev_err(&priv->client->dev, "Too many LED strings defined\n");
 			continue;
 		}

 		ret = fwnode_property_read_u32_array(child, "led-sources",
 						    led->hvled_strings,
-						    led->num_leds);
+						    led->num_led_strings);
 		if (ret) {
 			dev_err(&priv->client->dev, "led-sources property missing\n");
 			fwnode_handle_put(child);
 			goto child_out;
 		}

-		for (j = 0; j < led->num_leds; j++)
+		for (j = 0; j < led->num_led_strings; j++)
 			priv->bank_cfg |=
 				(led->control_bank << led->hvled_strings[j]);

@@ -317,6 +318,8 @@ static int lm3697_probe(struct i2c_client *client,
 	if (!led)
 		return -ENOMEM;

+	led->num_leds = count;
+
 	mutex_init(&led->lock);
 	i2c_set_clientdata(client, led);

--
2.28.0


------=_Part_34263_1921544507.1601730171258--
