Return-Path: <linux-leds+bounces-4022-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185AA3DC06
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D10C3BD1D7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 14:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858B1DEFE3;
	Thu, 20 Feb 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTE4jyqh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F221B1D63E6;
	Thu, 20 Feb 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060218; cv=none; b=W3cUS2riSEtX/50r1dI9NfYycpvWA27uavUvcdFYXi3MQ1WT6IwKlrtR/aYEqefodC6t1DDWHEUSgsf2ok93ipPYyt6o9O+Asae7Bw5znkMtEGIFw2ITxdCXcdutCp8cl7fG4mUkRWVRPvZOY5qyECN5JkrtwtK09gpAOEcAODk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060218; c=relaxed/simple;
	bh=0EX+QVCVUE9uC7LkUtaGFVjVr7eV1MA+QnuR/kW3uJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhKfyOYtkpg4TGingTKWB7AfvN/WOWyQTtjj8GcPvPufDyltV4lLeWEGuT6xhCn6AFPqxAddimSuizgUgAovEOheuaqYUyDTrb8mnUUToet83L8hJTL9VuKX/y68wG8C0KiXp13aA2NYPFd8D2LAsNwmD0PiTxrRIbRNBm9PVLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTE4jyqh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DE3C4CEE3;
	Thu, 20 Feb 2025 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740060217;
	bh=0EX+QVCVUE9uC7LkUtaGFVjVr7eV1MA+QnuR/kW3uJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTE4jyqh1HjfT7v+WGBhTqPMktNJLQMy3U1YdP+tu+QWyYSp2bCSAsii+YP7XEkt1
	 0+HRq9OJaU4HA1+nmOvb4NejUtmnoklwFZCDzyvK3KZbznm0RgF7LbGzO+CnHQaXda
	 fXA9yziARM780cilE42IAf/Hspr+ZnpixQx0JJcJm+R1h7H8ppwxS1iHHLuTDynsHZ
	 U+nlF06wxZvocvPE1QdJkmzETcdKWBqIA+/ehjTUnr+hYaMhAxlHewSX7uvonMEz17
	 JzsU4/vOpq4Y/MGN5ZeifdHqYXcW6JZit/uqy2joWoyPbcBnUKalO1XrSxcq7i7G+T
	 kSmZ4f4NuJNbw==
Date: Thu, 20 Feb 2025 14:03:33 +0000
From: Lee Jones <lee@kernel.org>
To: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>
Cc: patrick@stwcx.xyz, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] leds: cat9532: support cat9532 in pca955x
Message-ID: <20250220140333.GB8787@google.com>
References: <20250212071525.1148988-1-marshall_zhan@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212071525.1148988-1-marshall_zhan@wiwynn.com>

On Wed, 12 Feb 2025, MarshallZhan-wiwynn wrote:

> The CAT9532 chips are almost 100% compatible with PCA9552, except that
> the CAT9532 used the opposite polarity in register that sets on/off.

"uses"

> Compare the state at INPUT with the state of LSn and dynamically
> adjust how you program LSn
> 
> Signed-off-by: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>
> ---
>  drivers/leds/leds-pca955x.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 94a9f8a54b35..c5bb81473b6a 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -13,6 +13,7 @@
>   *     PCA9550         2-bit driver            0x60 .. 0x61
>   *     PCA9551         8-bit driver            0x60 .. 0x67
>   *     PCA9552         16-bit driver           0x60 .. 0x67
> + *     CAT9532         16-bit driver           0x60 .. 0x67

Strange placement.  This list looks alphabetical.

>   *     PCA9553/01      4-bit driver            0x62
>   *     PCA9553/02      4-bit driver            0x63
>   *
> @@ -235,6 +236,20 @@ static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
>         return 0;
>  }
> 
> +static int pca955x_read_input_bit(struct pca955x *pca955x, int led_num)
> +{
> +       u8 cmd = led_num / 8;
> +       int ret;
> +
> +       ret = i2c_smbus_read_byte_data(pca955x->client, cmd);

Better to rename 'ret' to something more forthcoming.

> +       if (ret < 0) {
> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, led_num, ret);
> +               return ret;
> +       }

'\n'
> +       return (ret >> (led_num % 8)) & 1;
> +
> +}
> +
>  static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>  {
>         struct pca955x_led *pca955x_led = container_of(led_cdev,
> @@ -251,10 +266,11 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>         ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
>         switch (ls) {
>         case PCA955X_LS_LED_ON:
> -               ret = LED_FULL;
> -               break;
>         case PCA955X_LS_LED_OFF:
> -               ret = LED_OFF;

This deserves a comment.

> +               if (pca955x_read_input_bit(pca955x, pca955x_led->led_num))
> +                       ret = LED_FULL;
> +               else
> +                       ret = LED_OFF;
>                 break;
>         case PCA955X_LS_BLINK0:
>                 ret = LED_HALF;
> @@ -276,6 +292,8 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>         struct pca955x_led *pca955x_led;
>         struct pca955x *pca955x;
>         u8 ls;
> +       u8 ls_last_state;
> +       int inupt_bit;

Did you even compile test this?

>         int chip_ls;    /* which LSx to use (0-3 potentially) */
>         int ls_led;     /* which set of bits within LSx to use (0-3) */
>         int ret;
> @@ -292,12 +310,21 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>         if (ret)
>                 goto out;
> 
> +       ls_last_state = pca955x_ledstate(ls, bit);
>         switch (value) {
>         case LED_FULL:
> -               ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
> +               input_bit = pca955x_read_input_bit(pca955x, pca955x_led->led_num);
> +               if (ls_last_state == input_bit)
> +                       ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
> +               else
> +                       ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
>                 break;
>         case LED_OFF:
> -               ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
> +               input_bit = pca955x_read_input_bit(pca955x, pca955x_led->led_num);
> +               if (ls_last_state == input_bit)
> +                       ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
> +               else
> +                       ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
>                 break;

These 2 sections are getting pretty messy and providing 6 calls to
pca955x_ledsel() doesn't sit right with me.  Can you think of a better
way to accomplish this?

>         case LED_HALF:
>                 ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
> --
> 2.25.1
> 
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

-- 
Lee Jones [李琼斯]

