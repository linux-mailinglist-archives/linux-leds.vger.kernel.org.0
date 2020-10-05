Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFF3283583
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 14:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgJEMNm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 08:13:42 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:49782 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726698AbgJEMNk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 08:13:40 -0400
Received: from in-2.websupport.sk (unknown [10.10.2.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id 9EF8ABDF16;
        Mon,  5 Oct 2020 14:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1601900016;
        bh=ytu0xIhTGqY6sjIKclFPHA8DEdRdtPDGKVsmJYqwltc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Xn9p8eZGiK9Tu8w/BjWhWcfmpMbeV8MU1etSFSvLZiSL6+5Iez3sACMQMoRqJD1/9
         NSUoTMa+9WSEt8Ticx3U/EBxTGEqAg8P8wcHUHZvo54vfyx/PM7ACTvvBMHH8pSv/9
         O6z9Ht5EWJUZptCjwIgmd40baEQJhZ3e/bwQqgBE=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-2.websupport.sk (Postfix) with ESMTPSA id 4C4fdX1kHsz40Xkq;
        Mon,  5 Oct 2020 14:13:36 +0200 (CEST)
Date:   Mon, 5 Oct 2020 14:13:34 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     ultracoolguy@tutanota.com
Cc:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Trivial <trivial@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005141334.36d9441a@blackhole.sk>
In-Reply-To: <MIiYgay--3-2@tutanota.com>
References: <MIiYgay--3-2@tutanota.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4C4fdX1kHsz40Xkq
Authentication-Results: in-2.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-4
X-Out-Spamd-Result: default: False [-3.10 / 24.00];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_FIVE(0.00)[6];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 3 Oct 2020 15:02:51 +0200 (CEST)
ultracoolguy@tutanota.com wrote:

> From 0dfd5ab647ccbc585c543d702b44d20f0e3fe436 Mon Sep 17 00:00:00 2001
> From: Ultracoolguy <ultracoolguy@tutanota.com>
> Date: Fri, 2 Oct 2020 18:27:00 -0400
> Subject: [PATCH] leds:lm3697:Fix out-of-bound access
> 
> If both led banks aren't used in device tree,
> an out-of-bounds condition in lm3697_init occurs
> because of the for loop assuming that all the banks are used.
> Fix it by adding a variable that contains the number of used banks.
> 
> Signed-off-by: Ultracoolguy <ultracoolguy@tutanota.com>
> ---
>  drivers/leds/leds-lm3697.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 024983088d59..a4ec2b6077e6 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -56,7 +56,7 @@ struct lm3697_led {
>  	struct ti_lmu_bank lmu_data;
>  	int control_bank;
>  	int enabled;
> -	int num_leds;
> +	int num_led_strings;

OK, I looked at the datasheet for this controlled. The controlled can
control 3 LED strings, each having several LEDs connected in series.
But only 2 different brightnesses can be set (control bank), so for each
string there is a register setting which control bank should control it.

The Control Bank is set via the `reg` DT property (reg=0 means
Control Bank A, reg=1 means Control Bank B). The `led-sources`
property defines which strings should be controlled by each bank.

So I think this variable name should stay num_leds (as in number of leds
in this control bank).
The structure though should be renamed:
  struct lm3697_led  ->  struct lm3697_bank.

>  };
> 
>  /**
> @@ -78,6 +78,7 @@ struct lm3697 {
>  	struct mutex lock;
> 
>  	int bank_cfg;
> +	int num_leds;

This should be named num_banks.

> 
>  	struct lm3697_led leds[];

This variable should be named banks, i.e.:
  struct lm3697_bank banks[];

>  };
> @@ -180,7 +181,7 @@ static int lm3697_init(struct lm3697 *priv)
>  	if (ret)
>  		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
> 
> -	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
> +	for (i = 0; i < priv->num_leds; i++) {

Ultracoolguy is correct that this for cycle should not iterate
LM3697_MAX_CONTROL_BANKS. Instead, the count check in lm3697_probe should be changed from

  if (!count)
to
  if (!count || count > LM3697_MAX_CONTROL_BANKS)

(the error message should also be changed, or maybe dropped, and the
error code changed from -ENODEV to -EINVAL, if we use || operator).

>  		led = &priv->leds[i];
>  		ret = ti_lmu_common_set_ramp(&led->lmu_data);
>  		if (ret)
> @@ -244,22 +245,22 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  		led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
>  						   led->control_bank * 2;
> 
> -		led->num_leds = fwnode_property_count_u32(child, "led-sources");
> -		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
> +		led->num_led_strings = fwnode_property_count_u32(child, "led-sources");
> +		if (led->num_led_strings > LM3697_MAX_LED_STRINGS) {
>  			dev_err(&priv->client->dev, "Too many LED strings defined\n");
>  			continue;
>  		}
> 
>  		ret = fwnode_property_read_u32_array(child, "led-sources",
>  						    led->hvled_strings,
> -						    led->num_leds);
> +						    led->num_led_strings);
>  		if (ret) {
>  			dev_err(&priv->client->dev, "led-sources property missing\n");
>  			fwnode_handle_put(child);
>  			goto child_out;
>  		}
> 
> -		for (j = 0; j < led->num_leds; j++)
> +		for (j = 0; j < led->num_led_strings; j++)
>  			priv->bank_cfg |=
>  				(led->control_bank << led->hvled_strings[j]);
> 
> @@ -317,6 +318,8 @@ static int lm3697_probe(struct i2c_client *client,
>  	if (!led)
>  		return -ENOMEM;
> 
> +	led->num_leds = count;
> +
>  	mutex_init(&led->lock);
>  	i2c_set_clientdata(client, led);
> 
> --
> 2.28.0
> 

Marek
