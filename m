Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC50828370D
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 15:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJEN5e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 09:57:34 -0400
Received: from w1.tutanota.de ([81.3.6.162]:38826 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgJEN5d (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 09:57:33 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 76ABBFA0807;
        Mon,  5 Oct 2020 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601906250;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=NGEwzOBuRGznEjUv4Fte4HsTlHtLwhYyJCJ7pqVqYEs=;
        b=mVE/VHk4axkW5K0DZb7r7URI7JTdSDNfkpClysbAkMD/b420sDv/GIXXzL5Om3aJ
        qSMC6v9Uj3GDwzBTGfRL0XVwemn6MkSqzUvGi4D7B2J1yeu8hC+i9E5/PVXzyI3mXn4
        rucOQeQLmsrqbLWXjqNaPeX1318lLVKf74Y6f4aDUuU+JwdbZwpvYqweo/5ZCbNVhpr
        rgFcoF5BNnt4ar3ar9KjwUke1NkaCXqbkT1GIPn8NvvvA7W+ixXVKQ6nT4wkZVwRjcl
        oINIiNpgtoCKEZ3C0X/Vinfo6/EYRSfDgx/eD/Z6PGRDcHoAHrvjH/g1SXPlrAHNWyE
        OvhIdqYbcg==
Date:   Mon, 5 Oct 2020 15:57:30 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Marek Behun <kabel@blackhole.sk>
Cc:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MIt2NiS--3-2@tutanota.com>
In-Reply-To: <20201005141334.36d9441a@blackhole.sk>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: multipart/mixed; 
        boundary="----=_Part_51663_1166462782.1601906250465"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

------=_Part_51663_1166462782.1601906250465
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I agree with you. 

Attached patch with changes.



Oct 5, 2020, 12:13 by kabel@blackhole.sk:

> On Sat, 3 Oct 2020 15:02:51 +0200 (CEST)
> ultracoolguy@tutanota.com wrote:
>
>> From 0dfd5ab647ccbc585c543d702b44d20f0e3fe436 Mon Sep 17 00:00:00 2001
>> From: Ultracoolguy <ultracoolguy@tutanota.com>
>> Date: Fri, 2 Oct 2020 18:27:00 -0400
>> Subject: [PATCH] leds:lm3697:Fix out-of-bound access
>>
>> If both led banks aren't used in device tree,
>> an out-of-bounds condition in lm3697_init occurs
>> because of the for loop assuming that all the banks are used.
>> Fix it by adding a variable that contains the number of used banks.
>>
>> Signed-off-by: Ultracoolguy <ultracoolguy@tutanota.com>
>> ---
>>  drivers/leds/leds-lm3697.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
>> index 024983088d59..a4ec2b6077e6 100644
>> --- a/drivers/leds/leds-lm3697.c
>> +++ b/drivers/leds/leds-lm3697.c
>> @@ -56,7 +56,7 @@ struct lm3697_led {
>>  struct ti_lmu_bank lmu_data;
>>  int control_bank;
>>  int enabled;
>> -	int num_leds;
>> +	int num_led_strings;
>>
>
> OK, I looked at the datasheet for this controlled. The controlled can
> control 3 LED strings, each having several LEDs connected in series.
> But only 2 different brightnesses can be set (control bank), so for each
> string there is a register setting which control bank should control it.
>
> The Control Bank is set via the `reg` DT property (reg=0 means
> Control Bank A, reg=1 means Control Bank B). The `led-sources`
> property defines which strings should be controlled by each bank.
>
> So I think this variable name should stay num_leds (as in number of leds
> in this control bank).
> The structure though should be renamed:
>  struct lm3697_led  ->  struct lm3697_bank.
>
>> };
>>
>>  /**
>> @@ -78,6 +78,7 @@ struct lm3697 {
>>  struct mutex lock;
>>
>>  int bank_cfg;
>> +	int num_leds;
>>
>
> This should be named num_banks.
>
>>
>> struct lm3697_led leds[];
>>
>
> This variable should be named banks, i.e.:
>  struct lm3697_bank banks[];
>
>> };
>> @@ -180,7 +181,7 @@ static int lm3697_init(struct lm3697 *priv)
>>  if (ret)
>>  dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
>>
>> -	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
>> +	for (i = 0; i < priv->num_leds; i++) {
>>
>
>  if (!count)
> to
>  if (!count || count > LM3697_MAX_CONTROL_BANKS)
>
> (the error message should also be changed, or maybe dropped, and the
> error code changed from -ENODEV to -EINVAL, if we use || operator).
>
>> led = &priv->leds[i];
>>  ret = ti_lmu_common_set_ramp(&led->lmu_data);
>>  if (ret)
>> @@ -244,22 +245,22 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>>  led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
>>  led->control_bank * 2;
>>
>> -		led->num_leds = fwnode_property_count_u32(child, "led-sources");
>> -		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
>> +		led->num_led_strings = fwnode_property_count_u32(child, "led-sources");
>> +		if (led->num_led_strings > LM3697_MAX_LED_STRINGS) {
>>  dev_err(&priv->client->dev, "Too many LED strings defined\n");
>>  continue;
>>  }
>>
>>  ret = fwnode_property_read_u32_array(child, "led-sources",
>>  led->hvled_strings,
>> -						    led->num_leds);
>> +						    led->num_led_strings);
>>  if (ret) {
>>  dev_err(&priv->client->dev, "led-sources property missing\n");
>>  fwnode_handle_put(child);
>>  goto child_out;
>>  }
>>
>> -		for (j = 0; j < led->num_leds; j++)
>> +		for (j = 0; j < led->num_led_strings; j++)
>>  priv->bank_cfg |=
>>  (led->control_bank << led->hvled_strings[j]);
>>
>> @@ -317,6 +318,8 @@ static int lm3697_probe(struct i2c_client *client,
>>  if (!led)
>>  return -ENOMEM;
>>
>> +	led->num_leds = count;
>> +
>>  mutex_init(&led->lock);
>>  i2c_set_clientdata(client, led);
>>
>> --
>> 2.28.0
>>
>
> Marek
>


------=_Part_51663_1166462782.1601906250465
Content-Type: text/x-patch; charset=us-ascii; 
	name=0001-leds-lm3697-Fix-out-of-bound-access.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-leds-lm3697-Fix-out-of-bound-access.patch

From 8382605d2eb7ff96625713d1f6400406c262e4c2 Mon Sep 17 00:00:00 2001
From: Ultracoolguy <ultracoolguy@tutanota.com>
Date: Fri, 2 Oct 2020 18:27:00 -0400
Subject: [PATCH] leds:lm3697:Fix out-of-bound access

If both led banks aren't used in device tree,
an out-of-bounds condition in lm3697_init occurs
because of the for loop assuming that all the banks are used.
Fix it by adding a variable that contains the number of used banks.
---
 drivers/leds/leds-lm3697.c | 97 ++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 47 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 024983088d59..9cb83f568172 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -48,7 +48,7 @@
  * @control_bank: Control bank the LED is associated to. 0 is control bank A
  *		   1 is control bank B
  */
-struct lm3697_led {
+struct lm3697_bank {
 	u32 hvled_strings[LM3697_MAX_LED_STRINGS];
 	char label[LED_MAX_NAME_SIZE];
 	struct led_classdev led_dev;
@@ -78,8 +78,9 @@ struct lm3697 {
 	struct mutex lock;

 	int bank_cfg;
+	int num_banks;

-	struct lm3697_led leds[];
+	struct lm3697_bank banks[];
 };

 static const struct reg_default lm3697_reg_defs[] = {
@@ -112,52 +113,52 @@ static const struct regmap_config lm3697_regmap_config = {
 static int lm3697_brightness_set(struct led_classdev *led_cdev,
 				enum led_brightness brt_val)
 {
-	struct lm3697_led *led = container_of(led_cdev, struct lm3697_led,
+	struct lm3697_bank *bank = container_of(led_cdev, struct lm3697_bank,
 					      led_dev);
-	int ctrl_en_val = (1 << led->control_bank);
+	int ctrl_en_val = (1 << bank->control_bank);
 	int ret;

-	mutex_lock(&led->priv->lock);
+	mutex_lock(&bank->priv->lock);

 	if (brt_val == LED_OFF) {
 		ret = regmap_update_bits(led->priv->regmap, LM3697_CTRL_ENABLE,
 					 ctrl_en_val, ~ctrl_en_val);
 		if (ret) {
-			dev_err(&led->priv->client->dev, "Cannot write ctrl register\n");
+			dev_err(&bank->priv->client->dev, "Cannot write ctrl register\n");
 			goto brightness_out;
 		}

-		led->enabled = LED_OFF;
+		bank->enabled = LED_OFF;
 	} else {
-		ret = ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
+		ret = ti_lmu_common_set_brightness(&bank->lmu_data, brt_val);
 		if (ret) {
-			dev_err(&led->priv->client->dev,
+			dev_err(&bank->priv->client->dev,
 				"Cannot write brightness\n");
 			goto brightness_out;
 		}

-		if (!led->enabled) {
-			ret = regmap_update_bits(led->priv->regmap,
+		if (!bank->enabled) {
+			ret = regmap_update_bits(bank->priv->regmap,
 						 LM3697_CTRL_ENABLE,
 						 ctrl_en_val, ctrl_en_val);
 			if (ret) {
-				dev_err(&led->priv->client->dev,
+				dev_err(&bank->priv->client->dev,
 					"Cannot enable the device\n");
 				goto brightness_out;
 			}

-			led->enabled = brt_val;
+			bank->enabled = brt_val;
 		}
 	}

 brightness_out:
-	mutex_unlock(&led->priv->lock);
+	mutex_unlock(&bank->priv->lock);
 	return ret;
 }

 static int lm3697_init(struct lm3697 *priv)
 {
-	struct lm3697_led *led;
+	struct lm3697_bank *bank;
 	int i, ret;

 	if (priv->enable_gpio) {
@@ -180,9 +181,9 @@ static int lm3697_init(struct lm3697 *priv)
 	if (ret)
 		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");

-	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
-		led = &priv->leds[i];
-		ret = ti_lmu_common_set_ramp(&led->lmu_data);
+	for (i = 0; i < priv->num_banks; i++) {
+		bank = &priv->banks[i];
+		ret = ti_lmu_common_set_ramp(&bank->lmu_data);
 		if (ret)
 			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
 	}
@@ -193,7 +194,7 @@ static int lm3697_init(struct lm3697 *priv)
 static int lm3697_probe_dt(struct lm3697 *priv)
 {
 	struct fwnode_handle *child = NULL;
-	struct lm3697_led *led;
+	struct lm3697_bank *bank;
 	const char *name;
 	int control_bank;
 	size_t i = 0;
@@ -228,63 +229,63 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 			goto child_out;
 		}

-		led = &priv->leds[i];
+		bank = &priv->banks[i];

 		ret = ti_lmu_common_get_brt_res(&priv->client->dev,
-						child, &led->lmu_data);
+						child, &bank->lmu_data);
 		if (ret)
			dev_warn(&priv->client->dev, "brightness resolution property missing\n");

-		led->control_bank = control_bank;
-		led->lmu_data.regmap = priv->regmap;
-		led->lmu_data.runtime_ramp_reg = LM3697_CTRL_A_RAMP +
+		bank->control_bank = control_bank;
+		bank->lmu_data.regmap = priv->regmap;
+		bank->lmu_data.runtime_ramp_reg = LM3697_CTRL_A_RAMP +
 						 control_bank;
-		led->lmu_data.msb_brightness_reg = LM3697_CTRL_A_BRT_MSB +
-						   led->control_bank * 2;
-		led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
-						   led->control_bank * 2;
+		bank->lmu_data.msb_brightness_reg = LM3697_CTRL_A_BRT_MSB +
+						   bank->control_bank * 2;
+		bank->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
+						   bank->control_bank * 2;

-		led->num_leds = fwnode_property_count_u32(child, "led-sources");
-		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
+		bank->num_leds = fwnode_property_count_u32(child, "led-sources");
+		if (bank->num_leds > LM3697_MAX_LED_STRINGS) {
 			dev_err(&priv->client->dev, "Too many LED strings defined\n");
 			continue;
 		}

 		ret = fwnode_property_read_u32_array(child, "led-sources",
-						    led->hvled_strings,
-						    led->num_leds);
+						    bank->hvled_strings,
+						    bank->num_leds);
 		if (ret) {
 			dev_err(&priv->client->dev, "led-sources property missing\n");
 			fwnode_handle_put(child);
 			goto child_out;
 		}

-		for (j = 0; j < led->num_leds; j++)
+		for (j = 0; j < bank->num_leds; j++)
 			priv->bank_cfg |=
-				(led->control_bank << led->hvled_strings[j]);
+				(bank->control_bank << bank->hvled_strings[j]);

 		ret = ti_lmu_common_get_ramp_params(&priv->client->dev,
-						    child, &led->lmu_data);
+						    child, &bank->lmu_data);
 		if (ret)
 			dev_warn(&priv->client->dev, "runtime-ramp properties missing\n");

 		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->led_dev.default_trigger);
+					    &bank->led_dev.default_trigger);

 		ret = fwnode_property_read_string(child, "label", &name);
 		if (ret)
-			snprintf(led->label, sizeof(led->label),
+			snprintf(bank->label, sizeof(bank->label),
 				"%s::", priv->client->name);
 		else
-			snprintf(led->label, sizeof(led->label),
+			snprintf(bank->label, sizeof(bank->label),
 				 "%s:%s", priv->client->name, name);

-		led->priv = priv;
-		led->led_dev.name = led->label;
-		led->led_dev.max_brightness = led->lmu_data.max_brightness;
-		led->led_dev.brightness_set_blocking = lm3697_brightness_set;
+		bank->priv = priv;
+		bank->led_dev.name = bank->label;
+		bank->led_dev.max_brightness = bank->lmu_data.max_brightness;
+		bank->led_dev.brightness_set_blocking = lm3697_brightness_set;

-		ret = devm_led_classdev_register(priv->dev, &led->led_dev);
+		ret = devm_led_classdev_register(priv->dev, &bank->led_dev);
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);
@@ -307,16 +308,18 @@ static int lm3697_probe(struct i2c_client *client,
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


------=_Part_51663_1166462782.1601906250465--
