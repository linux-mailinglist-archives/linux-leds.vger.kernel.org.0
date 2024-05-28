Return-Path: <linux-leds+bounces-1716-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C498D1546
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 09:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3353F1C22306
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29067317C;
	Tue, 28 May 2024 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="O0OOXarp"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4313873176;
	Tue, 28 May 2024 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716881011; cv=none; b=mwcWbeclKpFSIolX1+ZTHwz/VlRCEkONFY+QBsh9Yw2AwhQodR+xtItQ2XYbC/A03A9Q25bXwMHcBL0ISqoVRQPxp8ISg9j+8jyKl7cwUfqg+nTsjT7oMCVei19bNJIZdVxBcBS6Nb7ExPib0sHmMg83mJ96XEuFykcVsltwrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716881011; c=relaxed/simple;
	bh=qGU5JlrMsuABl4mUGVRRUSFDFh9LYrx/AxqE5rtqbt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4dEHrnxD5JA468PLfNqQzMszJqCXhJc0sPbx3OIbkl6H15//0/Cnz/LXwGPilNY9osW4nXTESjWgzfkhwzvtt0Gdb8OY71GqE4Wb/tJqKeTTiZgesOmvLRikmV9fjAHeoVVyN2ggyZjqBKV+GEfV6IVOZsfMGqxbR4ZseI8VPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=O0OOXarp; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716881008;
	bh=qGU5JlrMsuABl4mUGVRRUSFDFh9LYrx/AxqE5rtqbt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0OOXarpfObQLZqUS3urRzZ8Fj5F346arPWsIpEosz18yfVAm0lbf6rbXkfO8og7e
	 Bgs6SYdBMEu3iQVXtmjCXrqtcnlN1P4YfW+qRjbm/iy2vMpwQ+fz1jMDNJRViWEtju
	 MT5gTfqyy2zUNh195UvBcedWfmbLNGhMvRZZ75RU=
Date: Tue, 28 May 2024 09:23:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 4/5] leds: add ChromeOS EC driver
Message-ID: <0aa6c43c-152d-43cd-b436-8bf19844c8f1@t-8ch.de>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
 <20240520-cros_ec-led-v1-4-4068fc5c051a@weissschuh.net>
 <ZlVnCX41HdksPwUo@google.com>
 <2d03e62c-13ad-4c6f-94e1-7dff817386a4@t-8ch.de>
 <ZlWEeyPP57TT_FKv@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZlWEeyPP57TT_FKv@google.com>

On 2024-05-28 07:15:07+0000, Tzung-Bi Shih wrote:
> On Tue, May 28, 2024 at 07:25:07AM +0200, Thomas Weißschuh wrote:
> > On 2024-05-28 05:09:29+0000, Tzung-Bi Shih wrote:
> > > On Mon, May 20, 2024 at 12:00:32PM +0200, Thomas Weißschuh wrote:
> > > > +static int __init cros_ec_led_init(void)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = led_trigger_register(&cros_ec_led_trigger);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = platform_driver_register(&cros_ec_led_driver);
> > > > +	if (ret)
> > > > +		led_trigger_unregister(&cros_ec_led_trigger);
> > > > +
> > > > +	return ret;
> > > > +};
> > > > +module_init(cros_ec_led_init);
> > > > +
> > > > +static void __exit cros_ec_led_exit(void)
> > > > +{
> > > > +	platform_driver_unregister(&cros_ec_led_driver);
> > > > +	led_trigger_unregister(&cros_ec_led_trigger);
> > > > +};
> > > > +module_exit(cros_ec_led_exit);
> > > 
> > > I wonder it could use module_led_trigger() and module_platform_driver().
> > 
> > This won't compile as the macros generate various duplicate symbols.
> > 
> > Also the order is important, so I think the explicit logic is clearer.
> 
> I'm not sure if it is feasible by separating the trigger part to
> drivers/leds/trigger/ and specify it in `default_trigger`.

I don't think so.

The trigger is a private one and can only ever used with those LEDs.
(through cros_ec_led_trigger_type)

If we want to split it out we would need to export at least
cros_ec_led_trigger_type, cros_ec_led_cdev_to_priv,
cros_ec_led_cmd_arg_data, cros_ec_led_priv and more from leds-cros_ec to
the trigger.

