Return-Path: <linux-leds+bounces-1711-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC3B8D13D4
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 07:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C9311C211C2
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 05:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982A84C622;
	Tue, 28 May 2024 05:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="VCha2ysz"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00E4BA94;
	Tue, 28 May 2024 05:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716873913; cv=none; b=Vtb/IZ5TmoIgItnpN1tbZodVQiRsB+sCfR5cGw616uk6NsJpQ0SOnZXdzMbccFnNIIopYYV2KGtsK8u1HsKWxQUTSHv9Vd9ODE5BDFSR+5jKoxw/JU8lGCjAo9XPBIE9pIufNHtkOp1Oc4qjwoJVeU1UMFSHTz/0dx2FTKoF1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716873913; c=relaxed/simple;
	bh=Gfky+rMyWkV8sbPpaAIjMzUJ/Zxcd15pDaOIJ1yD3xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuSM5lR/aWCxuyEeHujjgLCFKJYqC7G6b1HT7oQKB2GO49fBwybVVpRRvTJkg3+pczQ0VL3cnTZYHiribZgolr2DXEbly1UWKQFGSPp79Nt90vplKsqmrqSpZLMeA+RQJ8L5Mqmf1A2GoFr3ilWQs5Ul4k/ad46nWaz4B94ruB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=VCha2ysz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716873907;
	bh=Gfky+rMyWkV8sbPpaAIjMzUJ/Zxcd15pDaOIJ1yD3xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCha2yszTY6l/8NOOLj5KXDhAcQgA9oUBr9OVLit2Q2fWzR77NjzZ5ApuUolUDajE
	 ib1cK4ZdAqOyN5mPkVEPpAyztQSVFa8f5ubAWY/Q5uyIbyJbKeK5eoXj9i7Ub5oCZI
	 NsM8Pm2+qiq3kSGnW+tFbxx26J78HRw4hBK/fcwY=
Date: Tue, 28 May 2024 07:25:07 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 4/5] leds: add ChromeOS EC driver
Message-ID: <2d03e62c-13ad-4c6f-94e1-7dff817386a4@t-8ch.de>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
 <20240520-cros_ec-led-v1-4-4068fc5c051a@weissschuh.net>
 <ZlVnCX41HdksPwUo@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZlVnCX41HdksPwUo@google.com>

On 2024-05-28 05:09:29+0000, Tzung-Bi Shih wrote:
> On Mon, May 20, 2024 at 12:00:32PM +0200, Thomas Weißschuh wrote:
> > diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> [...]
> > + *  ChromesOS EC LED Driver
> 
> s/ChromesOS/ChromeOS/.

Ack.

> > +static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
> > +{
> > +	struct cros_ec_led_priv *priv = cros_ec_led_cdev_to_priv(led_cdev);
> > +	union cros_ec_led_cmd_data arg = { };
> 
> To be neat, { } -> {}.

Ack.
 
> > +static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,
> > +					       enum led_brightness brightness)
> > +{
> > +	struct cros_ec_led_priv *priv = cros_ec_led_cdev_to_priv(led_cdev);
> > +	union cros_ec_led_cmd_data arg = { };
> 
> Ditto.
> 
> > +static int cros_ec_led_count_subleds(struct device *dev,
> > +				     struct ec_response_led_control *resp,
> > +				     unsigned int *max_brightness)
> > +{
> > +	unsigned int range, common_range = 0;
> > +	int num_subleds = 0;
> > +	size_t i;
> > +
> > +	for (i = 0; i < EC_LED_COLOR_COUNT; i++) {
> > +		range = resp->brightness_range[i];
> > +
> > +		if (!range)
> > +			continue;
> > +
> > +		num_subleds++;
> > +
> > +		if (!common_range)
> > +			common_range = range;
> > +
> > +		if (common_range != range) {
> > +			/* The multicolor LED API expects a uniform max_brightness */
> > +			dev_warn(dev, "Inconsistent LED brightness values\n");
> > +			return -EINVAL;
> > +		}
> 
> What if the array is [0, 1, 1]?

The "0" will be skipped by 

if (!range)
	continue;

And the two "1" will pass the check.

> 
> > +static int cros_ec_led_probe_led(struct device *dev, struct cros_ec_device *cros_ec,
> > +				 enum ec_led_id id)
> > +{
> > +	union cros_ec_led_cmd_data arg = { };
> 
> Ditto.
> 
> > +static int cros_ec_led_probe(struct platform_device *pdev)
> > +{
> [...]
> > +	int ret;
> > +
> > +	for (i = 0; i < EC_LED_ID_COUNT; i++) {
> > +		ret = cros_ec_led_probe_led(dev, cros_ec, i);
> > +		if (ret)
> > +			break;
> > +	}
> > +
> > +	return ret;
> 
> `ret` should be initialized in case EC_LED_ID_COUNT would be somehow 0.

As that's a constant define, this should never happen.
But after thinking about it, it seems a bit clearer.
The compiler should figure out that it's redundant anyways.

> > +static int __init cros_ec_led_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = led_trigger_register(&cros_ec_led_trigger);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = platform_driver_register(&cros_ec_led_driver);
> > +	if (ret)
> > +		led_trigger_unregister(&cros_ec_led_trigger);
> > +
> > +	return ret;
> > +};
> > +module_init(cros_ec_led_init);
> > +
> > +static void __exit cros_ec_led_exit(void)
> > +{
> > +	platform_driver_unregister(&cros_ec_led_driver);
> > +	led_trigger_unregister(&cros_ec_led_trigger);
> > +};
> > +module_exit(cros_ec_led_exit);
> 
> I wonder it could use module_led_trigger() and module_platform_driver().

This won't compile as the macros generate various duplicate symbols.

Also the order is important, so I think the explicit logic is clearer.


Thomas

