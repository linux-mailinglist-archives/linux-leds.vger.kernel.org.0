Return-Path: <linux-leds+bounces-1715-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CED8D151A
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 09:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FA41284701
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 07:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA3E4DA14;
	Tue, 28 May 2024 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKDEs/kf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA417E907;
	Tue, 28 May 2024 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880511; cv=none; b=CZLn2XPSCPqZR65WptkYtFuPeE0q5ra2AmktZSbeaMC2zqS3HAfooTROPZto8PxnIyDGI+pYKDLfZW2OmqcMHTnRgbhq0GwrdyqAzk7L+xLve6Y4k1iAMiBYXtWmAbcUhxkpmdlNa8cHzKERT5zgZestMzfIlXf77eqTQmPn58E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880511; c=relaxed/simple;
	bh=xH02X/BrGFvIYw1d94L55H3E8RigB+poWIBGO3mgTm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTgy9wN8hqHjIDmKrBx8I9UYn+4Nmse2MIcqCHR0V/PT7oibbpeOxnMCzCvv6RHZWTkhfpsl0yljSuufUf5rn6qSzbRQVbpywiMi6zWSWi8fZJTHiStXXWdC4ilYZ+F6DkbkGz/j13LO5Z7Ch5DSuvyVVyDFKOn7XEky8sJk1UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKDEs/kf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9D7C3277B;
	Tue, 28 May 2024 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716880511;
	bh=xH02X/BrGFvIYw1d94L55H3E8RigB+poWIBGO3mgTm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKDEs/kfGIYHggXmZmXVV57ObTHrAbxfrY55EnDPiJ20lA4ujFTu677qNe0lF45uQ
	 Fekn8Lzq5XU6U3uz4E4a7socbZmKOqIPN0GjITv/OMUelD+7PimRPSGAtncE4RuO5t
	 QVcG3qLEk36yD6bIWInydEYCVivwkiKN7nXxGbVXpS7GiIzRK9JvqAwnvGK9voJQLw
	 iR6YOvhzIe0iNrsB1VdWHbrO89YTVz8zBXUBs9b0O4nAlXDsJpreQh7vrboFJsg24x
	 kt+II6/izk+mnQK0vtuv1Fz6c2WHFykwdC535FPBaaUZguG6cWw5nUVbLjOSzjdtJD
	 uZv4mxRdE0YVw==
Date: Tue, 28 May 2024 07:15:07 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 4/5] leds: add ChromeOS EC driver
Message-ID: <ZlWEeyPP57TT_FKv@google.com>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
 <20240520-cros_ec-led-v1-4-4068fc5c051a@weissschuh.net>
 <ZlVnCX41HdksPwUo@google.com>
 <2d03e62c-13ad-4c6f-94e1-7dff817386a4@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d03e62c-13ad-4c6f-94e1-7dff817386a4@t-8ch.de>

On Tue, May 28, 2024 at 07:25:07AM +0200, Thomas Weißschuh wrote:
> On 2024-05-28 05:09:29+0000, Tzung-Bi Shih wrote:
> > On Mon, May 20, 2024 at 12:00:32PM +0200, Thomas Weißschuh wrote:
> > > +static int cros_ec_led_count_subleds(struct device *dev,
> > > +				     struct ec_response_led_control *resp,
> > > +				     unsigned int *max_brightness)
> > > +{
> > > +	unsigned int range, common_range = 0;
> > > +	int num_subleds = 0;
> > > +	size_t i;
> > > +
> > > +	for (i = 0; i < EC_LED_COLOR_COUNT; i++) {
> > > +		range = resp->brightness_range[i];
> > > +
> > > +		if (!range)
> > > +			continue;
> > > +
> > > +		num_subleds++;
> > > +
> > > +		if (!common_range)
> > > +			common_range = range;
> > > +
> > > +		if (common_range != range) {
> > > +			/* The multicolor LED API expects a uniform max_brightness */
> > > +			dev_warn(dev, "Inconsistent LED brightness values\n");
> > > +			return -EINVAL;
> > > +		}
> > 
> > What if the array is [0, 1, 1]?
> 
> The "0" will be skipped by 
> 
> if (!range)
> 	continue;
> 
> And the two "1" will pass the check.

Ack.

> > > +static int __init cros_ec_led_init(void)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = led_trigger_register(&cros_ec_led_trigger);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = platform_driver_register(&cros_ec_led_driver);
> > > +	if (ret)
> > > +		led_trigger_unregister(&cros_ec_led_trigger);
> > > +
> > > +	return ret;
> > > +};
> > > +module_init(cros_ec_led_init);
> > > +
> > > +static void __exit cros_ec_led_exit(void)
> > > +{
> > > +	platform_driver_unregister(&cros_ec_led_driver);
> > > +	led_trigger_unregister(&cros_ec_led_trigger);
> > > +};
> > > +module_exit(cros_ec_led_exit);
> > 
> > I wonder it could use module_led_trigger() and module_platform_driver().
> 
> This won't compile as the macros generate various duplicate symbols.
> 
> Also the order is important, so I think the explicit logic is clearer.

I'm not sure if it is feasible by separating the trigger part to
drivers/leds/trigger/ and specify it in `default_trigger`.

