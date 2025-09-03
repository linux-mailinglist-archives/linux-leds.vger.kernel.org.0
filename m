Return-Path: <linux-leds+bounces-5380-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3717FB42D28
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 01:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E56D47C2902
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 23:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE0F2E1C79;
	Wed,  3 Sep 2025 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="E9X/y0U+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D692DECBF;
	Wed,  3 Sep 2025 23:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756940489; cv=none; b=fc/oFJnmY0zWep6ahXNmt/XzHQ3Nhix/Wg38/QyWp5JiLOORU0pmhX01Fz72aMDMMpTFf/moBTIs95/FEXbhmyUlQfQWizhanU5/4KOVR8Eh5A2TrAwnTMisHhgCjrx3vV2+GjMbqGcse3V1Zr1klmTwC9wG5O/J8ylLNxyUyR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756940489; c=relaxed/simple;
	bh=lZ9xb05bUXxKypMRgvZnimpNmq21pgLVLuItt/0VFy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwkDQJAWGJsF3rvEUVumoZePZ+VURN7C/aUS9ptcH/H9Q1j2/q0qo7sXtRot3wOl8+3Nx3wz5hBhyXSm5yhjVwI0QtYJ2RrbOv60P3yRDLyn2plpYNtSsjSPZwKOsFsPy8VqLKFNO7ImrOH00HwS+W1gEj456dE3eFzWBIP7okw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=E9X/y0U+; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1756940477; x=1757199677;
	bh=auZFfKxrrTCXJ1CCI6DDscX7wnIOgy6WBhNj7GtVhbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=E9X/y0U+Gnzi8BWpYc3G+wxmYVKc4FEQXrvwuJPBcJfnCvtOdEG+CJ2hTngoFc7fL
	 XvPdNlVAE+oZSifPj1NkGoT5D8iicgZ1YrCmNASznGLkVeW6fTQUj0QNQm44q7NI90
	 KuQDdjzv9iPx3BfIYx9cdvRjT6nyRYLJEWcXgBrNc3Ucln6QMWpA3Tij5qNh6baqjk
	 OByzA6ewal95TXMPkcwFHeVw3bvVAdNaVpUeRLtl5vlAkYXk4+/aji5OFkkG9xBezG
	 DZRcZcKb1tZ+iZbSBj4S6ThF071boS5QfS2jqAoVQpzPslxwJNLMFe9mg5pIoG0uhG
	 ZczV9pTksa67Q==
X-Pm-Submission-Id: 4cHJ4q3ZjKz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
To: hansg@kernel.org,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: andy.shevchenko@gmail.com,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
Date: Thu,  4 Sep 2025 01:01:12 +0200
Message-ID: <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
References: <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Hi Aleksandrs,
> 
> Thank you for working on this.
> 
> On 2-Sep-25 1:10 PM, Aleksandrs Vinarskis wrote:
> > From: Hans de Goede <hansg@kernel.org>
> > 
> > Turn of_led_get() into a more generic __of_led_get() helper function,
> > which can lookup LEDs in devicetree by either name or index.
> > 
> > And use this new helper to add devicetree support to the generic
> > (non devicetree specific) [devm_]led_get() function.
> > 
> > This uses the standard devicetree pattern of adding a -names string array
> > to map names to the indexes for an array of resources.
> > 
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reviewed-by: Lee Jones <lee@kernel.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Please update this to:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> to match the update of the author which you already did.
> 
> Also note that checkpatch should complain about the mismatch,
> please ensure to run checkpatch before posting v2.

Hi,

ahh, I actually did not even see that email got changed, apologies. Seems
'b4' auto-corrected it when sending, which would explain why checkpatch
did not catch it, as I run it before importing and sending via 'b4'. Sure,
will fix - did you mean to change your signoff to R-by, or is it a mistake?

> 
> > Tested-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >  drivers/leds/led-class.c | 38 +++++++++++++++++++++++++++++---------
> >  1 file changed, 29 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 15633fbf3c166aa4f521774d245f6399a642bced..6f2ef4fa556b44ed3bf69dff556ae16fd2b7652b 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -248,19 +248,18 @@ static const struct class leds_class = {
> >  	.pm = &leds_class_dev_pm_ops,
> >  };
> >  
> > -/**
> > - * of_led_get() - request a LED device via the LED framework
> > - * @np: device node to get the LED device from
> > - * @index: the index of the LED
> > - *
> > - * Returns the LED device parsed from the phandle specified in the "leds"
> > - * property of a device tree node or a negative error-code on failure.
> > - */
> > -static struct led_classdev *of_led_get(struct device_node *np, int index)
> > +static struct led_classdev *__of_led_get(struct device_node *np, int index,
> > +					 const char *name)
> >  {
> >  	struct device *led_dev;
> >  	struct device_node *led_node;
> >  
> > +	/*
> > +	 * For named LEDs, first look up the name in the "led-names" property.
> > +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> > +	 */
> > +	if (name)
> > +		index = of_property_match_string(np, "led-names", name);
> >  	led_node = of_parse_phandle(np, "leds", index);
> >  	if (!led_node)
> >  		return ERR_PTR(-ENOENT);
> > @@ -271,6 +270,20 @@ static struct led_classdev *of_led_get(struct device_node *np, int index)
> >  	return led_module_get(led_dev);
> >  }
> >  
> > +/**
> > + * of_led_get() - request a LED device via the LED framework
> > + * @np: device node to get the LED device from
> > + * @index: the index of the LED
> > + *
> > + * Returns the LED device parsed from the phandle specified in the "leds"
> > + * property of a device tree node or a negative error-code on failure.
> > + */
> > +struct led_classdev *of_led_get(struct device_node *np, int index)
> > +{
> > +	return __of_led_get(np, index, NULL);
> > +}
> > +EXPORT_SYMBOL_GPL(of_led_get);
> 
> I probably did this myself, but since of_led_get() is private now
> (I guess it was not private before?) and since we are moving away from
> "of" specific functions to using generic dev_xxxx functions in the kernel
> in general, I think this just should be a static helper.
> 
> Or probably even better: just add the name argument to of_led_get()
> before without renaming it, update the existing callers to pass
> an extra NULL arg and completely drop this wrapper.
> 

That indeed sounds like a better and cleaner option, will change it.
This way also incorporates the rest of the feedback on this series.

> Also notice that adding the EXPORT_SYMBOL_GPL() while there was
> none before should go hand in hand with adding a prototype to
> a relevant .h file. However please just keep this private and
> drop the wrapper.

Thanks for the clarification, missed that, and the review.

Alex

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> > +
> >  /**
> >   * led_put() - release a LED device
> >   * @led_cdev: LED device
> > @@ -342,9 +355,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
> >  struct led_classdev *led_get(struct device *dev, char *con_id)
> >  {
> >  	struct led_lookup_data *lookup;
> > +	struct led_classdev *led_cdev;
> >  	const char *provider = NULL;
> >  	struct device *led_dev;
> >  
> > +	if (dev->of_node) {
> > +		led_cdev = __of_led_get(dev->of_node, -1, con_id);
> > +		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> > +			return led_cdev;
> > +	}
> > +
> >  	mutex_lock(&leds_lookup_lock);
> >  	list_for_each_entry(lookup, &leds_lookup_list, list) {
> >  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
> > 

