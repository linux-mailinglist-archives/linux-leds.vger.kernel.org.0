Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC04DDA1B
	for <lists+linux-leds@lfdr.de>; Sat, 19 Oct 2019 20:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfJSSdR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Oct 2019 14:33:17 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53140 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfJSSdR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Oct 2019 14:33:17 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so9241782wmh.2;
        Sat, 19 Oct 2019 11:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=wyIWKIMdSpZ8g9011rp0bv2NXpDq0n5OZuboEeutHYU=;
        b=BISMambalFE9RdHWFNYq8ksPghZdx8fcdZVkvowvRmb0JhkZu21v4EqAQC5lkwtQBh
         02pW9v793cXXxdw6sCc06exPlvw0uQbvTUDCMq9UrwHdVbJf5y6/wC9jRPpdFfWphNN6
         gneAZTBJvkYrfeU+ybyEkFoVaU7lIFscG6gFiJ6AXIPeFv4VbSbEdzByLpVeprc1Fn9D
         zGJgFqJRVjOHwaVDExJWIxmO78J17r5rwKjlncNmZzmKDPGEBCcPVYhDycSBoorm5LZ7
         KZjJW86svfW/O30XgtXO41YOmNBJIxY6MU9E5IWFiRV2RaPyfgME7gZB30aN62cEKoes
         /wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=wyIWKIMdSpZ8g9011rp0bv2NXpDq0n5OZuboEeutHYU=;
        b=Ej8KSCJNVCbfcsPKn6Py+oQP9qcKKxjtQrLbqrs4h2ebeS5EiCz+RHnJ+WZZTnYcVW
         qYts47JCF/ynN9oTEtNWPK2JLMy/cknUa5eHOcUWf9MLfQLYJxb7ErNO0ruGy3siAMJp
         kiyopbrEZiYq/4teWDf1JJW/0bsF4K/bVJsKZHUGDbisWCutRMsbEh13YSh3fLxYRq7H
         yDMFqA5aY78apWY16Y53rgIPbIYa7LKKFfn9IajDhUCZm9cheptJmFabvXgIrkl3Be8T
         IRhT2URBfAlXzyvvnC+fb+uwLVM7ZDPjGi3J9WPiQXud13hZFaoeBGxlcmsiJOoKn7OP
         NpOQ==
X-Gm-Message-State: APjAAAUStqdpuEvw6DpK/vNyy3oVCyTzpiW3gyUqSN54ya2DP6YMLbCq
        poHvODK3RFPd9pdmQNawhxANAfSD
X-Google-Smtp-Source: APXvYqz4a4jkzEIveesVs6J8MpaOqJeafYNC+rgBZ6VfEthVOq9ZJGCjevmjpztF3Das+0eWQQRkHw==
X-Received: by 2002:a1c:55c4:: with SMTP id j187mr12562829wmb.155.1571509993015;
        Sat, 19 Oct 2019 11:33:13 -0700 (PDT)
Received: from [192.168.1.19] (bdt81.neoplus.adsl.tpnet.pl. [83.28.5.81])
        by smtp.gmail.com with ESMTPSA id q124sm17444310wma.5.2019.10.19.11.33.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Oct 2019 11:33:12 -0700 (PDT)
Subject: Re: [PATCH v13 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191016155954.29044-1-dmurphy@ti.com>
 <20191016155954.29044-5-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <141a58aa-654e-6edf-b84c-b451b7b2d96b@gmail.com>
Date:   Sat, 19 Oct 2019 20:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016155954.29044-5-dmurphy@ti.com>
Content-Type: multipart/mixed;
 boundary="------------F1057529D76C2ED616F0DE37"
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------F1057529D76C2ED616F0DE37
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Dan,

On 10/16/19 5:59 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
> 
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
[...]
> +static int led_multicolor_init_color(struct led_classdev_mc *mcled_cdev,
> +				     int color_id)
> +{
> +	struct led_classdev *led_cdev = mcled_cdev->led_cdev;
> +	struct led_mc_color_entry *mc_priv;
> +	char *intensity_file_name;
> +	char *max_intensity_file_name;
> +	size_t len;
> +	int ret;
> +
> +	mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv), GFP_KERNEL);
> +	if (!mc_priv)
> +		return -ENOMEM;
> +
> +	mc_priv->led_color_id = color_id;
> +	mc_priv->mcled_cdev = mcled_cdev;
> +
> +	sysfs_attr_init(&mc_priv->intensity_attr.attr);
> +	len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
> +	intensity_file_name = kzalloc(len, GFP_KERNEL);
> +	if (!intensity_file_name)
> +		return -ENOMEM;
> +
> +	snprintf(intensity_file_name, len, "%s%s",
> +		 led_colors[color_id], INTENSITY_NAME);
> +	mc_priv->intensity_attr.attr.name = intensity_file_name;
> +	mc_priv->intensity_attr.attr.mode = 0644;
> +	mc_priv->intensity_attr.store = intensity_store;
> +	mc_priv->intensity_attr.show = intensity_show;
> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
> +				      &mc_priv->intensity_attr.attr,
> +				      led_color_group.name);
> +	if (ret)
> +		goto intensity_err_out;
> +
> +	sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
> +	len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME) + 1;
> +	max_intensity_file_name = kzalloc(len, GFP_KERNEL);
> +	if (!max_intensity_file_name) {
> +		ret = -ENOMEM;
> +		goto intensity_err_out;
> +	}
> +
> +	snprintf(max_intensity_file_name, len, "%s%s",
> +		 led_colors[color_id], MAX_INTENSITY_NAME);
> +	mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
> +	mc_priv->max_intensity_attr.attr.mode = 0444;
> +	mc_priv->max_intensity_attr.show = max_intensity_show;
> +	ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
> +				      &mc_priv->max_intensity_attr.attr,
> +				      led_color_group.name);
> +	if (ret)
> +		goto max_intensity_err_out;
> +
> +	mc_priv->max_intensity = LED_FULL;
> +	list_add_tail(&mc_priv->list, &mcled_cdev->color_list);

We don't need the list here since our collection of color LEDs will
be fixed. Instead of the list we can do with a dynamically allocated
array of a size depending on available color LEDs.

It will allow also to get rid of lp55xx_map_channel() since random
access to array elements will be possible via lookup tables mapping
colors to array element id.

And regarding my amendments to the DT parser - attached is the
patch for your patch, that is compile-tested.

> +
> +max_intensity_err_out:
> +	kfree(max_intensity_file_name);
> +intensity_err_out:
> +	kfree(intensity_file_name);
> +	return ret;
> +}
> +
>
-- 
Best regards,
Jacek Anaszewski

--------------F1057529D76C2ED616F0DE37
Content-Type: text/x-patch;
 name="0001-DT-parser-amendments.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-DT-parser-amendments.patch"

=46rom fb0ce79b97acf6ee68ec4a2a9e24d56080826766 Mon Sep 17 00:00:00 2001
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Sat, 19 Oct 2019 19:45:18 +0200
Subject: [PATCH] DT parser amendments

---
 drivers/leds/leds-lp55xx-common.c         | 109 ++++++++++++++++--------=
------
 include/linux/platform_data/leds-lp55xx.h |   1 +
 2 files changed, 61 insertions(+), 49 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx=
-common.c
index 0764520bc4a8..0244ec9bad8d 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -590,82 +590,93 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *ch=
ip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
=20
-static int lp5xx_parse_common_child(struct device_node *np,
-				    struct lp55xx_led_config *cfg,
-				    int chan_num, bool is_multicolor,
-				    int color_num)
+static int lp55xx_parse_common_child(struct device_node *np,
+				     struct lp55xx_led_config *cfg,
+				     int led_number, int *chan_nr)
 {
-	u32 led_number;
 	int ret;
=20
 	of_property_read_string(np, "chan-name",
-				&cfg[chan_num].name);
+				&cfg[led_number].name);
 	of_property_read_u8(np, "led-cur",
-			    &cfg[chan_num].led_current);
+			    &cfg[led_number].led_current);
 	of_property_read_u8(np, "max-cur",
-			    &cfg[chan_num].max_current);
+			    &cfg[led_number].max_current);
=20
-	ret =3D of_property_read_u32(np, "reg", &led_number);
+	ret =3D of_property_read_u32(np, "reg", chan_nr);
 	if (ret)
 		return ret;
=20
-	if (led_number < 0 || led_number > 6)
+	if (chan_nr < 0 || chan_nr > cfg->max_channel)
 		return -EINVAL;
=20
-	if (is_multicolor)
-		cfg[chan_num].color_components[color_num].output_num =3D
-								led_number;
-	else
-		cfg[chan_num].chan_nr =3D led_number;
-
 	return 0;
 }
=20
-static int lp5xx_parse_channel_child(struct device_node *np,
-				     struct lp55xx_led_config *cfg,
-				     int child_number)
+static int lp55xx_parse_mutli_led_child(struct device_node *child,
+					 struct lp55xx_led_config *cfg,
+					 int child_number, int color_number)
 {
-	struct device_node *child;
-	int channel_color;
-	int num_colors =3D 0;
-	u32 color_id;
-	int ret;
-
-	cfg[child_number].default_trigger =3D
-			of_get_property(np, "linux,default-trigger", NULL);
+	int chan_nr, color_id, ret;
=20
-	ret =3D of_property_read_u32(np, "color", &channel_color);
+	ret =3D lp55xx_parse_common_child(child, cfg, child_number, &chan_nr);
 	if (ret)
-		channel_color =3D ret;
+		return ret;
=20
+	ret =3D of_property_read_u32(child, "color", &color_id);
+	if (ret)
+	       return ret;
=20
-	if (channel_color =3D=3D LED_COLOR_ID_MULTI) {
-		for_each_child_of_node(np, child) {
-			ret =3D lp5xx_parse_common_child(child, cfg,
-						       child_number, true,
-						       num_colors);
-			if (ret)
-				return ret;
+	cfg[child_number].color_components[color_number].color_id =3D color_id;=

+	cfg[child_number].color_components[color_number].output_num =3D chan_nr=
;
+	set_bit(color_id, &cfg[child_number].available_colors);
=20
-			ret =3D of_property_read_u32(child, "color", &color_id);
-			if (ret)
-				return ret;
+	return 0;
+}
=20
-			cfg[child_number].color_components[num_colors].color_id =3D
-						color_id;
-			set_bit(color_id, &cfg[child_number].available_colors);
-			num_colors++;
-		}
+static int lp55xx_parse_mutli_led(struct device_node *np,
+				  struct lp55xx_led_config *cfg,
+				  int child_number)
+{
+	struct device_node *child;
+	int num_colors =3D 0, ret;
=20
-		cfg[child_number].num_colors =3D num_colors;
-	} else {
-		return lp5xx_parse_common_child(np, cfg, child_number, false,
-						num_colors);
+	for_each_child_of_node(np, child) {
+		ret =3D lp55xx_parse_mutli_led_child(child, cfg, child_number,
+						   num_colors);
+		if (ret)
+			return ret;
+		num_colors++;
 	}
=20
 	return 0;
 }
=20
+static int lp55xx_parse_logical_led(struct device_node *np,
+				   struct lp55xx_led_config *cfg,
+				   int child_number)
+{
+	int led_color, ret;
+
+	cfg[child_number].default_trigger =3D
+		of_get_property(np, "linux,default-trigger", NULL);
+
+	ret =3D of_property_read_u32(np, "color", &led_color);
+
+	if (ret) {
+		int chan_nr;
+		ret =3D  lp55xx_parse_common_child(np, cfg, child_number,
+						 &chan_nr);
+		if (ret < 0)
+		       return ret;
+		cfg[child_number].chan_nr =3D chan_nr;
+	} else if (led_color =3D=3D LED_COLOR_ID_MULTI) {
+		return lp55xx_parse_mutli_led(np, cfg, child_number);
+	}
+
+	return ret;
+}
+
 struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev=
,
 						      struct device_node *np)
 {
@@ -694,7 +705,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata=
(struct device *dev,
 	pdata->num_channels =3D num_channels;
=20
 	for_each_child_of_node(np, child) {
-		ret =3D lp5xx_parse_channel_child(child, cfg, i);
+		ret =3D lp55xx_parse_logical_led(child, cfg, i);
 		if (ret)
 			return ERR_PTR(-EINVAL);
 		i++;
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/pl=
atform_data/leds-lp55xx.h
index ead9d145de0d..dca21b19a283 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -28,6 +28,7 @@ struct lp55xx_led_config {
 	u8 led_current; /* mA x10, 0 if led is not connected */
 	u8 max_current;
 	int num_colors;
+	unsigned int max_channel;
 	unsigned long available_colors;
 	struct led_mc_color_conversion color_components[LP55XX_MAX_GROUPED_CHAN=
];
 };
--=20
2.11.0


--------------F1057529D76C2ED616F0DE37--
