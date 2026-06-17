Return-Path: <linux-leds+bounces-8635-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gi2DKLFgMmrozAUAu9opvQ
	(envelope-from <linux-leds+bounces-8635-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:54:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F68D697AEE
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:54:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CpgBMEeA;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8635-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8635-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 286A630A27B0
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFD03CEB84;
	Wed, 17 Jun 2026 08:48:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E53E1227
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:48:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686115; cv=none; b=FYB9/XX/kiMqZd9F2ro+GHs8FG1S0NqhTgyjvmxx6nUxb9w6crJRy3ksxUlm5mbbyxNH4/vIY92RtndRK1Ao5YYtihkC2Wjdqp5/pPt77EG8eT+ORksBp6uuO7rvG2fLTSOufryXNFQ3aIMZY/2ZzUpL+gnK6et08szVkEmlxY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686115; c=relaxed/simple;
	bh=1QaWi0842cfBosestcQX3hIf9s6Gj+jhmJawSOLpAsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCHvwEvUBFVsDF3X/LQWcMydYvBXD4LWfqic4t3VEQe0Lqu42eneqsrn5HirVf73VmKpjI+dRoaxrB4Db+bKYZFjSAj15ek8JbZ/iGyTXEIPbWhp4iyC56FKahBMojGXwO5csTrb43tX/7viLR/DAkiw10b0LYKg3pDuTEQTV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpgBMEeA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F931F01568;
	Wed, 17 Jun 2026 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781686105;
	bh=hHtR+1ZP4rkBM7stCMtS5oFJ4nuYFrbiHuhCYzKCH8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CpgBMEeA7rrvztGYJKEsxFhvpe/cS38pXZ2QbkWbfMQl0esv19SEdA80KCgIs3C/h
	 HTZ5ThjLftp45KuUiqBfnI0FTLhwSifiocmLkwlJqh1eH/4FwtrN4xI/o9MYNAz8FA
	 xRLDA4SCdc5PQXoQL1G2gXOfJ4TW0zsgzqkn1EFNx3EhMyNWu5irtOeOIkBUg5+cXo
	 Ps9xK2NRdOqMAgviCsOrpP3XQM+4Pz0XF9uvHZuwjhJvIgVM5RP02HFrLtPi4W5owJ
	 syjtklkctGFy1Iz7hIGi3VjRph+qXJlf53sAAn3xi9GxNlXg+b1iyE5weo1/ppTzcC
	 t3TymDLY0KBQA==
Date: Wed, 17 Jun 2026 09:48:21 +0100
From: Lee Jones <lee@kernel.org>
To: Lorenzo Egidio <lorenzoegidioms@gmail.com>
Cc: pavel@ucw.cz, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: tests: use a fresh instance for name conflict
 rejection
Message-ID: <20260617084821.GD10056@google.com>
References: <20260612230606.1438-1-lorenzoegidioms@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612230606.1438-1-lorenzoegidioms@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzoegidioms@gmail.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8635-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F68D697AEE

On Fri, 12 Jun 2026, Lorenzo Egidio wrote:

> The LED_REJECT_NAME_CONFLICT test currently re-registers an
> already registered led_classdev instance.
> 
> Use a fresh copy instead so the test exercises the
> name-conflict rejection path directly.
> 
> Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>

How did you author this patch?  Honestly.

> ---
>  drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
>  1 file changed, 66 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
> index ddf9aa967..36aef3e13 100644
> --- a/drivers/leds/led-test.c
> +++ b/drivers/leds/led-test.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> +// leds: tests: clarify name conflict test

Why did you add this?

>  /*
>   * Copyright (C) 2025 Google LLC
>   *
> @@ -10,77 +11,106 @@
>  #include <linux/device.h>
>  #include <linux/leds.h>
>  
> -#define LED_TEST_POST_REG_BRIGHTNESS 10
> +enum {
> +	LED_TEST_POST_REG_BRIGHTNESS = 10,
> +};

Why?

> -struct led_test_ddata {
> +struct led_test_data {

Why rename?

>  	struct led_classdev cdev;
>  	struct device *dev;
>  };
>  
> -static enum led_brightness led_test_brightness_get(struct led_classdev *cdev)
> +static enum led_brightness
> +led_test_brightness_get(struct led_classdev *cdev)

Why?

>  {
>  	return LED_TEST_POST_REG_BRIGHTNESS;
>  }
>  
> -static void led_test_class_register(struct kunit *test)
> +static void led_test_init_cdev(struct led_classdev *cdev)
>  {
> -	struct led_test_ddata *ddata = test->priv;
> -	struct led_classdev *cdev_clash, *cdev = &ddata->cdev;
> -	struct device *dev = ddata->dev;
> -	int ret;
> +	memset(cdev, 0, sizeof(*cdev));

Why?

>  
> -	/* Register a LED class device */
>  	cdev->name = "led-test";
> -	cdev->brightness_get = led_test_brightness_get;
>  	cdev->brightness = 0;
> +	cdev->brightness_get = led_test_brightness_get;
> +}
> +
> +static void led_test_class_register(struct kunit *test)
> +{
> +	struct led_test_data *data = test->priv;
> +	struct led_classdev *cdev = &data->cdev;
> +	struct led_classdev *cdev_clash;
> +	struct led_classdev *cdev_reject;
> +	struct device *dev = data->dev;
> +	int ret;
> +
> +	led_test_init_cdev(cdev);
>  
>  	ret = devm_led_classdev_register(dev, cdev);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	KUNIT_EXPECT_NOT_NULL(test, cdev->dev);

How could this happen?

>  	KUNIT_EXPECT_EQ(test, cdev->max_brightness, LED_FULL);
> -	KUNIT_EXPECT_EQ(test, cdev->brightness, LED_TEST_POST_REG_BRIGHTNESS);
> +	KUNIT_EXPECT_EQ(test, cdev->brightness,
> +			LED_TEST_POST_REG_BRIGHTNESS);

Why?

>  	KUNIT_EXPECT_STREQ(test, cdev->dev->kobj.name, "led-test");
>  
> -	/* Register again with the same name - expect it to pass with the LED renamed */
> +	/*
> +	 * Name collision should be resolved automatically by
> +	 * renaming the device instance while preserving the
> +	 * logical LED name.
> +	 */
>  	cdev_clash = devm_kmemdup(dev, cdev, sizeof(*cdev), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_clash);
>  
>  	ret = devm_led_classdev_register(dev, cdev_clash);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> -	KUNIT_EXPECT_STREQ(test, cdev_clash->dev->kobj.name, "led-test_1");
> -	KUNIT_EXPECT_STREQ(test, cdev_clash->name, "led-test");
> +	KUNIT_EXPECT_STREQ(test,
> +			   cdev_clash->dev->kobj.name,
> +			   "led-test_1");
> +	KUNIT_EXPECT_STREQ(test,
> +			   cdev_clash->name,
> +			   "led-test");

Why?

>  
> -	/* Enable name conflict rejection and register with the same name again - expect failure */
> -	cdev_clash->flags |= LED_REJECT_NAME_CONFLICT;
> -	ret = devm_led_classdev_register(dev, cdev_clash);
> +	/*
> +	 * Verify that explicit conflict rejection fails.
> +	 */

Why did you write a single line comment like this?

> +	cdev_reject = devm_kmemdup(dev, cdev, sizeof(*cdev), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_reject);
> +
> +	cdev_reject->flags |= LED_REJECT_NAME_CONFLICT;
> +
> +	ret = devm_led_classdev_register(dev, cdev_reject);
>  	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
>  }
>  
>  static void led_test_class_add_lookup_and_get(struct kunit *test)
>  {
> -	struct led_test_ddata *ddata = test->priv;
> -	struct led_classdev *cdev = &ddata->cdev, *cdev_get;
> -	struct device *dev = ddata->dev;
> -	struct led_lookup_data lookup;
> +	struct led_test_data *data = test->priv;
> +	struct led_classdev *cdev = &data->cdev;
> +	struct led_classdev *cdev_get;
> +	struct device *dev = data->dev;
> +	struct led_lookup_data lookup = { };
>  	int ret;
>  
> -	/* First, register a LED class device */
> -	cdev->name = "led-test";
> +	led_test_init_cdev(cdev);
> +
>  	ret = devm_led_classdev_register(dev, cdev);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> -	/* Then make the LED available for lookup */
>  	lookup.provider = cdev->name;
>  	lookup.dev_id = dev_name(dev);
>  	lookup.con_id = "led-test-1";
> +
>  	led_add_lookup(&lookup);
>  
> -	/* Finally, attempt to look it up via the API - imagine this was an orthogonal driver */

You have removed all commentary - why?

>  	cdev_get = devm_led_get(dev, "led-test-1");
> -	KUNIT_ASSERT_FALSE(test, IS_ERR(cdev_get));
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_get);
>  
> -	KUNIT_EXPECT_STREQ(test, cdev_get->name, cdev->name);
> +	KUNIT_EXPECT_STREQ(test,
> +			   cdev_get->name,
> +			   cdev->name);

Why?

>  
>  	led_remove_lookup(&lookup);
>  }
> @@ -93,30 +123,29 @@ static struct kunit_case led_test_cases[] = {
>  
>  static int led_test_init(struct kunit *test)
>  {
> -	struct led_test_ddata *ddata;
> +	struct led_test_data *data;
>  	struct device *dev;
>  
> -	ddata = kunit_kzalloc(test, sizeof(*ddata), GFP_KERNEL);
> -	if (!ddata)
> +	data = kunit_kzalloc(test, sizeof(*data), GFP_KERNEL);
> +	if (!data)
>  		return -ENOMEM;
>  
> -	test->priv = ddata;
> -
>  	dev = kunit_device_register(test, "led_test");
>  	if (IS_ERR(dev))
>  		return PTR_ERR(dev);
>  
> -	ddata->dev = get_device(dev);
> +	data->dev = get_device(dev);
> +	test->priv = data;
>  
>  	return 0;
>  }
>  
>  static void led_test_exit(struct kunit *test)
>  {
> -	struct led_test_ddata *ddata = test->priv;
> +	struct led_test_data *data = test->priv;
>  
> -	if (ddata && ddata->dev)
> -		put_device(ddata->dev);
> +	if (data && data->dev)
> +		put_device(data->dev);
>  }
>  
>  static struct kunit_suite led_test_suite = {
> @@ -125,6 +154,7 @@ static struct kunit_suite led_test_suite = {
>  	.exit = led_test_exit,
>  	.test_cases = led_test_cases,
>  };
> +

Why?

>  kunit_test_suite(led_test_suite);
>  
>  MODULE_AUTHOR("Lee Jones <lee@kernel.org>");
> -- 
> 2.51.0
> 

-- 
Lee Jones

