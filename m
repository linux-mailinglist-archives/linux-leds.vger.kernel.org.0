Return-Path: <linux-leds+bounces-3235-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C139B9642
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 18:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010A51F22D26
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 17:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52C81A3BD5;
	Fri,  1 Nov 2024 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3csCSRv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0551BD9DC;
	Fri,  1 Nov 2024 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480918; cv=none; b=HjLUsXM92BxUaVI/Cp0B8ivFn9MULDVhIQNP5pw+Tj62SASDx2QzKAfAz0ahVlL/ZfzaOly7W48eDtOxtiGsSMaoGqqmTFwFf4BsSF698jJVCQKV/iReE3r5paaornMA9AxPPpruWe0PSbjyADtzTKR1bKp0wjd6M6/UTesxl38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480918; c=relaxed/simple;
	bh=4IaPTnugpJN9TNoIToEYMJATzos6K4uQOPUgwQkdzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MN4OEh6E4s7/etoB4i6ODQnROwHptCyNH6fSwm8KMu86Ocrij6Tsy27beRAONSfLsKI3qPPjyr9Qu3mA9vbZBBmlbmSH9D8XlIc66vUR23YpKSitYygSXZ9QMge814Z28bxAdb/joRJUSdeJWZ1yRYgzOcsACW9HuB5yDGN1bOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3csCSRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04C3C4CECD;
	Fri,  1 Nov 2024 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730480917;
	bh=4IaPTnugpJN9TNoIToEYMJATzos6K4uQOPUgwQkdzJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3csCSRvi/mUGlJrXCLx168lCjXnU7Z4eDN5vriESmzr8Y0s2wPAPR0bUusXn3zNO
	 5psK3aTlSQ0dPcQNQ4M7V5vWdtB7t3QUSSl3T1dg33epLwCmAwDu4qrin7z2zc+N1v
	 LoX9C+0hg/mGJ7i1xWAxjgYQLWKgEG4eYiSDk/yyQl9JOAx3n5PS9svXgB1R0vhsjs
	 NkjyJXNG//PRHGNArIrRqKN/UnTMEDpE0kg1xS2umVACn2zx6NU2b2vBaPC7HRQG6V
	 oBfOsK8cFN6YQPiAhNIz2Cc+fde8hIHzn0A5SzCYGdeI/8+wBtKFgpAByP6yFagPC6
	 xDbJRQyP4Rj1w==
Date: Fri, 1 Nov 2024 17:08:33 +0000
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: class: Protect brightness_show() with
 led_cdev->led_access mutex
Message-ID: <20241101170833.GB1807686@google.com>
References: <20241025171128.1226045-1-quic_mojha@quicinc.com>
 <62b09eee-553a-a3d1-e2e0-59dee7289019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62b09eee-553a-a3d1-e2e0-59dee7289019@gmail.com>

On Sun, 27 Oct 2024, Jacek Anaszewski wrote:

> Hi Mukesh,
> 
> On 10/25/24 19:11, Mukesh Ojha wrote:
> > There is NULL pointer issue observed if from Process A where hid device
> > being added which results in adding a led_cdev addition and later a
> > another call to access of led_cdev attribute from Process B can result
> > in NULL pointer issue.
> > 
> > Use mutex led_cdev->led_access to protect access to led->cdev and its
> > attribute inside brightness_show() and max_brightness_show() and also
> > update the comment for mutex that it should be used to protect the led
> > class device fields.

[...]

> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> > Changes in v2:
> >   - Updated the comment for led_access mutex lock.
> >   - Also added mutex protection for max_brightness_show().
> > 
> >   drivers/leds/led-class.c | 14 +++++++++++---
> >   include/linux/leds.h     |  2 +-
> >   2 files changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 06b97fd49ad9..f69f4e928d61 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -29,11 +29,14 @@ static ssize_t brightness_show(struct device *dev,
> >   		struct device_attribute *attr, char *buf)
> >   {
> >   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > +	unsigned int brightness;
> > -	/* no lock needed for this */
> > +	mutex_lock(&led_cdev->led_access);
> >   	led_update_brightness(led_cdev);
> > +	brightness = led_cdev->brightness;
> > +	mutex_unlock(&led_cdev->led_access);
> > -	return sprintf(buf, "%u\n", led_cdev->brightness);
> > +	return sprintf(buf, "%u\n", brightness);
> >   }
> >   static ssize_t brightness_store(struct device *dev,
> > @@ -70,8 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
> >   		struct device_attribute *attr, char *buf)
> >   {
> >   	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > +	unsigned int max_brightness;
> > +
> > +	mutex_lock(&led_cdev->led_access);
> > +	max_brightness = led_cdev->max_brightness;
> > +	mutex_unlock(&led_cdev->led_access);
> > -	return sprintf(buf, "%u\n", led_cdev->max_brightness);
> > +	return sprintf(buf, "%u\n", max_brightness);
> >   }
> >   static DEVICE_ATTR_RO(max_brightness);
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index e5968c3ed4ae..3524634fcc47 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -238,7 +238,7 @@ struct led_classdev {
> >   	struct kernfs_node	*brightness_hw_changed_kn;
> >   #endif
> > -	/* Ensures consistent access to the LED Flash Class device */
> > +	/* Ensures consistent access to the LED Class device */
> 
> Nit: It was improper in the original comment as well:
> 
> s/Class/class/

Some things can't be unseen.  Please submit v3.

-- 
Lee Jones [李琼斯]

