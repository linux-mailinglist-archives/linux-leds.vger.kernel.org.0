Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9E4283A95
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 17:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgJEPfn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 11:35:43 -0400
Received: from w1.tutanota.de ([81.3.6.162]:58116 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727705AbgJEPfl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 11:35:41 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 76F0AFA0409;
        Mon,  5 Oct 2020 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601912138;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=SQ7PPtdszXSdouVfMwi6At92x1cFP7TUpv38XEqLah8=;
        b=aAzw5EaXfDUXCX+g0Ni7Pr+sWwte1VfgxsM1iEUarobxj7SnXfXtK+14r073hwHl
        urwrDEElYnFoSWx1s1Gd41jISFQ/autPccnpzmWk3HmIp8t0IvBXPbAnA+tRZD6EGGA
        GsHCKGvQuhy4rhvxEg2aDTrFynw79SFUXX6h124xM2nUpTHC0y6PyzB4BrXSOgoCoG/
        +IeftMkRzP1zMw4IOsUM3Ai4YxDTrO6hMXPvWNnUBZoSJ25tiKovucX8wP33FyfNBFC
        znjrGeFWDmj2U30IKRrqDcz03LfGcaEauTJC9WagdGv4y0nrbGr9PHeMmRlLrqIAAmz
        ZHH45GVhVw==
Date:   Mon, 5 Oct 2020 17:35:38 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek Behun <kabel@blackhole.sk>, Pavel <pavel@ucw.cz>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Message-ID: <MItOR9Z--3-2@tutanota.com>
In-Reply-To: <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com> <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: multipart/mixed; 
        boundary="----=_Part_57540_1049994367.1601912138472"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

------=_Part_57540_1049994367.1601912138472
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Well, the major benefit I see is that it makes the driver slightly more readable. However I'm fine with whatever you guys decide.

I'll attach the patch with the struct renaming removed just in case.



Oct 5, 2020, 14:41 by dmurphy@ti.com:

> Gabriel
>
> On 10/5/20 9:38 AM, ultracoolguy@tutanota.com wrote:
>
>> I understand. So I should leave it like it was and do the rename in another patch?
>>
>
> You should do the fix in one patch and leave the structure name alone.
>
> The structure naming if fine and has no benefit and actually will make it more difficult for others to backport future fixes.
>
> Unless Pavel finds benefit in accepting the structure rename.
>
> Dan
>


------=_Part_57540_1049994367.1601912138472
Content-Type: text/x-patch; charset=us-ascii; 
	name=0001-leds-lm3697-Fix-out-of-bound-access.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-leds-lm3697-Fix-out-of-bound-access.patch

From ee004d26bb2f91491141aa06f5518cc411711ff0 Mon Sep 17 00:00:00 2001
From: Ultracoolguy <ultracoolguy@tutanota.com>
Date: Fri, 2 Oct 2020 18:27:00 -0400
Subject: [PATCH] leds:lm3697:Fix out-of-bound access

If both led banks aren't used in device tree,
an out-of-bounds condition in lm3697_init occurs
because of the for loop assuming that all the banks are used.
Fix it by adding a variable that contains the number of used banks.
---
 drivers/leds/leds-lm3697.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 024983088d59..bd53450050b2 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -78,8 +78,9 @@ struct lm3697 {
 	struct mutex lock;
 
 	int bank_cfg;
+	int num_banks;
 
-	struct lm3697_led leds[];
+	struct lm3697_led banks[];
 };
 
 static const struct reg_default lm3697_reg_defs[] = {
@@ -180,8 +181,8 @@ static int lm3697_init(struct lm3697 *priv)
 	if (ret)
 		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
 
-	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
-		led = &priv->leds[i];
+	for (i = 0; i < priv->num_banks; i++) {
+		led = &priv->banks[i];
 		ret = ti_lmu_common_set_ramp(&led->lmu_data);
 		if (ret)
 			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
@@ -228,7 +229,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 			goto child_out;
 		}
 
-		led = &priv->leds[i];
+		led = &priv->banks[i];
 
 		ret = ti_lmu_common_get_brt_res(&priv->client->dev,
 						child, &led->lmu_data);
@@ -307,16 +308,17 @@ static int lm3697_probe(struct i2c_client *client,
 	int ret;
 
 	count = device_get_child_node_count(&client->dev);
-	if (!count) {
-		dev_err(&client->dev, "LEDs are not defined in device tree!");
-		return -ENODEV;
+	if (!count || count > LM3697_MAX_CONTROL_BANKS) {
+		return -EINVAL;
 	}
 
-	led = devm_kzalloc(&client->dev, struct_size(led, leds, count),
+	led = devm_kzalloc(&client->dev, struct_size(led, banks, count),
 			   GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
+	led->num_banks = count;
+
 	mutex_init(&led->lock);
 	i2c_set_clientdata(client, led);
 
-- 
2.28.0


------=_Part_57540_1049994367.1601912138472--
