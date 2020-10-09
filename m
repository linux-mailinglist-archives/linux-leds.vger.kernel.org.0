Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C6A288D52
	for <lists+linux-leds@lfdr.de>; Fri,  9 Oct 2020 17:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389144AbgJIPvu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Oct 2020 11:51:50 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:18833 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388745AbgJIPvu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2020 11:51:50 -0400
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id 6EFCE2004D9D;
        Fri,  9 Oct 2020 15:51:45 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Fkk+S1Gy"
Date:   Fri, 09 Oct 2020 15:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1602258701;
        bh=Z8cRmymZDiat5g8lOxpg3X47vm1HbTPdbsT9vFOf+G0=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Fkk+S1Gyl+FlFuZgXgdyJ6/wfuf2PyfjMu7mvy5mKH1ObPVjJImtLtly+TvDClUiV
         81EEjP+aFl62CUPM+lEq1h2OmiWksCJQTLBhrCia7JqxA7G0AyQn8U2sBmOdkUZZS/
         683vHs2JsWsXhHQ0vrOJAkvdiSUTlPFbjEm7R+Ug=
To:     dmurphy@ti.com, pavel@ucw.cz
From:   Gabriel David <ultracoolguy4@protonmail.com>
Cc:     kabel@blackhole.sk, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gabriel David <ultracoolguy4@protonmail.com>
Reply-To: Gabriel David <ultracoolguy4@protonmail.com>
Subject: [PATCH v2] leds: lm3697: Rename struct into more appropriate name
Message-ID: <nH0fAuRxkhh0jdtlck5LucnuXiEY2wfpLF8C8spK8hebUUZ75xQOe-PjBtR7F8jEZ84l-o9rVJ3z9xvatOAJMjvbH5qCQIO5MuSOmpWr0ZQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The mentioned struct, lm3697_led, was renamed to lm3697_bank since the
structure is representing the control banks. This name, in my opinion,
is more semantically correct. The pointers referring to it were also
renamed.

Signed-off-by: Gabriel David <ultracoolguy4@protonmail.com>
---
Yes, this is the same Gabriel David from ultracoolguy@tutanota.org and
ultracoolguy@disroot.org. If you want me to confirm it I'll gladly do
it.

 drivers/leds/leds-lm3697.c | 90 +++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 31f5ed486839..c62f95fc17e8 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -39,7 +39,7 @@
 #define LM3697_MAX_CONTROL_BANKS 2

 /**
- * struct lm3697_led -
+ * struct lm3697_bank -
  * @hvled_strings: Array of LED strings associated with a control bank
  * @label: LED label
  * @led_dev: LED class device
@@ -48,7 +48,7 @@
  * @control_bank: Control bank the LED is associated to. 0 is control bank=
 A
  *=09=09   1 is control bank B
  */
-struct lm3697_led {
+struct lm3697_bank {
 =09u32 hvled_strings[LM3697_MAX_LED_STRINGS];
 =09char label[LED_MAX_NAME_SIZE];
 =09struct led_classdev led_dev;
@@ -80,7 +80,7 @@ struct lm3697 {
 =09int bank_cfg;
 =09int num_banks;

-=09struct lm3697_led leds[];
+=09struct lm3697_bank banks[];
 };

 static const struct reg_default lm3697_reg_defs[] =3D {
@@ -113,52 +113,52 @@ static const struct regmap_config lm3697_regmap_confi=
g =3D {
 static int lm3697_brightness_set(struct led_classdev *led_cdev,
 =09=09=09=09enum led_brightness brt_val)
 {
-=09struct lm3697_led *led =3D container_of(led_cdev, struct lm3697_led,
+=09struct lm3697_bank *bank =3D container_of(led_cdev, struct lm3697_bank,
 =09=09=09=09=09      led_dev);
-=09int ctrl_en_val =3D (1 << led->control_bank);
+=09int ctrl_en_val =3D (1 << bank->control_bank);
 =09int ret;

-=09mutex_lock(&led->priv->lock);
+=09mutex_lock(&bank->priv->lock);

 =09if (brt_val =3D=3D LED_OFF) {
-=09=09ret =3D regmap_update_bits(led->priv->regmap, LM3697_CTRL_ENABLE,
+=09=09ret =3D regmap_update_bits(bank->priv->regmap, LM3697_CTRL_ENABLE,
 =09=09=09=09=09 ctrl_en_val, ~ctrl_en_val);
 =09=09if (ret) {
-=09=09=09dev_err(&led->priv->client->dev, "Cannot write ctrl register\n");
+=09=09=09dev_err(&bank->priv->client->dev, "Cannot write ctrl register\n")=
;
 =09=09=09goto brightness_out;
 =09=09}

-=09=09led->enabled =3D LED_OFF;
+=09=09bank->enabled =3D LED_OFF;
 =09} else {
-=09=09ret =3D ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
+=09=09ret =3D ti_lmu_common_set_brightness(&bank->lmu_data, brt_val);
 =09=09if (ret) {
-=09=09=09dev_err(&led->priv->client->dev,
+=09=09=09dev_err(&bank->priv->client->dev,
 =09=09=09=09"Cannot write brightness\n");
 =09=09=09goto brightness_out;
 =09=09}

-=09=09if (!led->enabled) {
-=09=09=09ret =3D regmap_update_bits(led->priv->regmap,
+=09=09if (!bank->enabled) {
+=09=09=09ret =3D regmap_update_bits(bank->priv->regmap,
 =09=09=09=09=09=09 LM3697_CTRL_ENABLE,
 =09=09=09=09=09=09 ctrl_en_val, ctrl_en_val);
 =09=09=09if (ret) {
-=09=09=09=09dev_err(&led->priv->client->dev,
+=09=09=09=09dev_err(&bank->priv->client->dev,
 =09=09=09=09=09"Cannot enable the device\n");
 =09=09=09=09goto brightness_out;
 =09=09=09}

-=09=09=09led->enabled =3D brt_val;
+=09=09=09bank->enabled =3D brt_val;
 =09=09}
 =09}

 brightness_out:
-=09mutex_unlock(&led->priv->lock);
+=09mutex_unlock(&bank->priv->lock);
 =09return ret;
 }

 static int lm3697_init(struct lm3697 *priv)
 {
-=09struct lm3697_led *led;
+=09struct lm3697_bank *bank;
 =09int i, ret;

 =09if (priv->enable_gpio) {
@@ -182,8 +182,8 @@ static int lm3697_init(struct lm3697 *priv)
 =09=09dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");

 =09for (i =3D 0; i < priv->num_banks; i++) {
-=09=09led =3D &priv->leds[i];
-=09=09ret =3D ti_lmu_common_set_ramp(&led->lmu_data);
+=09=09bank =3D &priv->banks[i];
+=09=09ret =3D ti_lmu_common_set_ramp(&bank->lmu_data);
 =09=09if (ret)
 =09=09=09dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
 =09}
@@ -194,7 +194,7 @@ static int lm3697_init(struct lm3697 *priv)
 static int lm3697_probe_dt(struct lm3697 *priv)
 {
 =09struct fwnode_handle *child =3D NULL;
-=09struct lm3697_led *led;
+=09struct lm3697_bank *bank;
 =09const char *name;
 =09int control_bank;
 =09size_t i =3D 0;
@@ -229,63 +229,63 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 =09=09=09goto child_out;
 =09=09}

-=09=09led =3D &priv->leds[i];
+=09=09bank =3D &priv->banks[i];

 =09=09ret =3D ti_lmu_common_get_brt_res(&priv->client->dev,
-=09=09=09=09=09=09child, &led->lmu_data);
+=09=09=09=09=09=09child, &bank->lmu_data);
 =09=09if (ret)
 =09=09=09dev_warn(&priv->client->dev, "brightness resolution property miss=
ing\n");

-=09=09led->control_bank =3D control_bank;
-=09=09led->lmu_data.regmap =3D priv->regmap;
-=09=09led->lmu_data.runtime_ramp_reg =3D LM3697_CTRL_A_RAMP +
+=09=09bank->control_bank =3D control_bank;
+=09=09bank->lmu_data.regmap =3D priv->regmap;
+=09=09bank->lmu_data.runtime_ramp_reg =3D LM3697_CTRL_A_RAMP +
 =09=09=09=09=09=09 control_bank;
-=09=09led->lmu_data.msb_brightness_reg =3D LM3697_CTRL_A_BRT_MSB +
-=09=09=09=09=09=09   led->control_bank * 2;
-=09=09led->lmu_data.lsb_brightness_reg =3D LM3697_CTRL_A_BRT_LSB +
-=09=09=09=09=09=09   led->control_bank * 2;
+=09=09bank->lmu_data.msb_brightness_reg =3D LM3697_CTRL_A_BRT_MSB +
+=09=09=09=09=09=09   bank->control_bank * 2;
+=09=09bank->lmu_data.lsb_brightness_reg =3D LM3697_CTRL_A_BRT_LSB +
+=09=09=09=09=09=09   bank->control_bank * 2;

-=09=09led->num_leds =3D fwnode_property_count_u32(child, "led-sources");
-=09=09if (led->num_leds > LM3697_MAX_LED_STRINGS) {
+=09=09bank->num_leds =3D fwnode_property_count_u32(child, "led-sources");
+=09=09if (bank->num_leds > LM3697_MAX_LED_STRINGS) {
 =09=09=09dev_err(&priv->client->dev, "Too many LED strings defined\n");
 =09=09=09continue;
 =09=09}

 =09=09ret =3D fwnode_property_read_u32_array(child, "led-sources",
-=09=09=09=09=09=09    led->hvled_strings,
-=09=09=09=09=09=09    led->num_leds);
+=09=09=09=09=09=09    bank->hvled_strings,
+=09=09=09=09=09=09    bank->num_leds);
 =09=09if (ret) {
 =09=09=09dev_err(&priv->client->dev, "led-sources property missing\n");
 =09=09=09fwnode_handle_put(child);
 =09=09=09goto child_out;
 =09=09}

-=09=09for (j =3D 0; j < led->num_leds; j++)
+=09=09for (j =3D 0; j < bank->num_leds; j++)
 =09=09=09priv->bank_cfg |=3D
-=09=09=09=09(led->control_bank << led->hvled_strings[j]);
+=09=09=09=09(bank->control_bank << bank->hvled_strings[j]);

 =09=09ret =3D ti_lmu_common_get_ramp_params(&priv->client->dev,
-=09=09=09=09=09=09    child, &led->lmu_data);
+=09=09=09=09=09=09    child, &bank->lmu_data);
 =09=09if (ret)
 =09=09=09dev_warn(&priv->client->dev, "runtime-ramp properties missing\n")=
;

 =09=09fwnode_property_read_string(child, "linux,default-trigger",
-=09=09=09=09=09    &led->led_dev.default_trigger);
+=09=09=09=09=09    &bank->led_dev.default_trigger);

 =09=09ret =3D fwnode_property_read_string(child, "label", &name);
 =09=09if (ret)
-=09=09=09snprintf(led->label, sizeof(led->label),
+=09=09=09snprintf(bank->label, sizeof(bank->label),
 =09=09=09=09"%s::", priv->client->name);
 =09=09else
-=09=09=09snprintf(led->label, sizeof(led->label),
+=09=09=09snprintf(bank->label, sizeof(bank->label),
 =09=09=09=09 "%s:%s", priv->client->name, name);

-=09=09led->priv =3D priv;
-=09=09led->led_dev.name =3D led->label;
-=09=09led->led_dev.max_brightness =3D led->lmu_data.max_brightness;
-=09=09led->led_dev.brightness_set_blocking =3D lm3697_brightness_set;
+=09=09bank->priv =3D priv;
+=09=09bank->led_dev.name =3D bank->label;
+=09=09bank->led_dev.max_brightness =3D bank->lmu_data.max_brightness;
+=09=09bank->led_dev.brightness_set_blocking =3D lm3697_brightness_set;

-=09=09ret =3D devm_led_classdev_register(priv->dev, &led->led_dev);
+=09=09ret =3D devm_led_classdev_register(priv->dev, &bank->led_dev);
 =09=09if (ret) {
 =09=09=09dev_err(&priv->client->dev, "led register err: %d\n",
 =09=09=09=09ret);
@@ -313,7 +313,7 @@ static int lm3697_probe(struct i2c_client *client,
 =09=09return -ENODEV;
 =09}

-=09led =3D devm_kzalloc(&client->dev, struct_size(led, leds, count),
+=09led =3D devm_kzalloc(&client->dev, struct_size(led, banks, count),
 =09=09=09   GFP_KERNEL);
 =09if (!led)
 =09=09return -ENOMEM;
--
2.28.0


