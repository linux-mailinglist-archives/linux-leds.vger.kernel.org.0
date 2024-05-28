Return-Path: <linux-leds+bounces-1710-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7109D8D13B6
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 07:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED89CB21F55
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 05:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3887A3E487;
	Tue, 28 May 2024 05:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jw8UdCnR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A12563;
	Tue, 28 May 2024 05:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716872974; cv=none; b=ZZY1uj5NkOo2w42+oBifr/TbDMZj08lP6yRgmAWUVPbmNLHmW5laao+IAUxbJxgP9xJA74ebRTwF69hRNi+3aFcO38cvtpEvfKOtM5dF5l/pgWxvXuAMgVSxw6sroaaQJquUOrYj+T92s+iDTEw/N6rq7/BWxC9xi6KTsSO1924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716872974; c=relaxed/simple;
	bh=kpsGV9jcYDW5WH47X5uu4EzSSt+qtbgWJWijGgX7koo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD13TrBiJM4NlH5eUv3Sa04KAz71ZDryYjPUAZ5dkRP4RC9OMM9DzWtQTsCVkZmfZW7jnYFm1qFVD3NOTU/GWoRktMjUe+XsESykxnOa9amPfOJmUYGHtWI2HORRVA0iLu0ofofOzOvOJUhFXYD7GDhG0/aGSGcvK8qii3s/FEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jw8UdCnR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DFCC3277B;
	Tue, 28 May 2024 05:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716872973;
	bh=kpsGV9jcYDW5WH47X5uu4EzSSt+qtbgWJWijGgX7koo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jw8UdCnRTpugfMOeiexIUSTXOeR+Z7O8Tyda/mjBme7P1bw6OTB4+UDom2mZMduXy
	 Zma14INdm43UEG6aTxz1rVEKqL8pK+VMWF29pqAtnCROYNXSDL3Ycji34KzWAeFk77
	 lqlhYnamYEy99IEa3HAcd5yFGuDdqoBnyMk1/ghvOYoy8D2HfdXG9VkmFZ+YkH3SIc
	 DsVN8l/hDhYj2lskZaQCRvpW6+8uAzewAwb2GcqZVXBDrxVT3itmIcHozbgqxWnp0k
	 VirsDf95IZVSaqUDVswfGziUpudIrH2Ir5q+ZiFqKrwanCJu7hBA7yefFRVW5KxYjs
	 cVMj7jKb0ex4g==
Date: Tue, 28 May 2024 05:09:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 4/5] leds: add ChromeOS EC driver
Message-ID: <ZlVnCX41HdksPwUo@google.com>
References: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
 <20240520-cros_ec-led-v1-4-4068fc5c051a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520-cros_ec-led-v1-4-4068fc5c051a@weissschuh.net>

On Mon, May 20, 2024 at 12:00:32PM +0200, Thomas Weißschuh wrote:
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
[...]
> + *  ChromesOS EC LED Driver

s/ChromesOS/ChromeOS/.

> +static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
> +{
> +	struct cros_ec_led_priv *priv = cros_ec_led_cdev_to_priv(led_cdev);
> +	union cros_ec_led_cmd_data arg = { };

To be neat, { } -> {}.

> +static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,
> +					       enum led_brightness brightness)
> +{
> +	struct cros_ec_led_priv *priv = cros_ec_led_cdev_to_priv(led_cdev);
> +	union cros_ec_led_cmd_data arg = { };

Ditto.

> +static int cros_ec_led_count_subleds(struct device *dev,
> +				     struct ec_response_led_control *resp,
> +				     unsigned int *max_brightness)
> +{
> +	unsigned int range, common_range = 0;
> +	int num_subleds = 0;
> +	size_t i;
> +
> +	for (i = 0; i < EC_LED_COLOR_COUNT; i++) {
> +		range = resp->brightness_range[i];
> +
> +		if (!range)
> +			continue;
> +
> +		num_subleds++;
> +
> +		if (!common_range)
> +			common_range = range;
> +
> +		if (common_range != range) {
> +			/* The multicolor LED API expects a uniform max_brightness */
> +			dev_warn(dev, "Inconsistent LED brightness values\n");
> +			return -EINVAL;
> +		}

What if the array is [0, 1, 1]?

> +static int cros_ec_led_probe_led(struct device *dev, struct cros_ec_device *cros_ec,
> +				 enum ec_led_id id)
> +{
> +	union cros_ec_led_cmd_data arg = { };

Ditto.

> +static int cros_ec_led_probe(struct platform_device *pdev)
> +{
[...]
> +	int ret;
> +
> +	for (i = 0; i < EC_LED_ID_COUNT; i++) {
> +		ret = cros_ec_led_probe_led(dev, cros_ec, i);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;

`ret` should be initialized in case EC_LED_ID_COUNT would be somehow 0.

> +static int __init cros_ec_led_init(void)
> +{
> +	int ret;
> +
> +	ret = led_trigger_register(&cros_ec_led_trigger);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&cros_ec_led_driver);
> +	if (ret)
> +		led_trigger_unregister(&cros_ec_led_trigger);
> +
> +	return ret;
> +};
> +module_init(cros_ec_led_init);
> +
> +static void __exit cros_ec_led_exit(void)
> +{
> +	platform_driver_unregister(&cros_ec_led_driver);
> +	led_trigger_unregister(&cros_ec_led_trigger);
> +};
> +module_exit(cros_ec_led_exit);

I wonder it could use module_led_trigger() and module_platform_driver().

