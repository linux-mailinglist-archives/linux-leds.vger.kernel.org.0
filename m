Return-Path: <linux-leds+bounces-1713-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A638D1401
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 07:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77FBC1F22CC8
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2024 05:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5954CB4E;
	Tue, 28 May 2024 05:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Td8z5VNt"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2B40BE5;
	Tue, 28 May 2024 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716874873; cv=none; b=UCbutdUbNpxtUTUg4qPDUY/scGUh9Dra0Zw+bZiP2YyDHZRIPO9pc+fSmDeKGFwKvsRj4LNlQaRnhXOo7AvvR5dJ/gagzkwsAYCGcyF63lpdHFPClGSs6w8Jn7eH1M6TRJOEimfn/M+8QaSJkllMNcaAKaM8lY3aBC6ttteUV4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716874873; c=relaxed/simple;
	bh=Ed6LE+X1MIVzGMmlXw4d0umQaiRtTlhp8W/JqWUNy5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddeHIXs2galWJh15SA3p+kQn6EfdF/0Zipw49gfdu4/JmUGa8mVraNl9kmd9t2Whgkg5rE0Ed18gT/hlNYIyfM6CBA5ZrwJt5Ldb46AGBjPsZoOLnZL5QcXZKRn0l2YDJd9ypNWRC3y12CNKplb5p5uX8aAKIUFi22YEXHb84so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Td8z5VNt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716874870;
	bh=Ed6LE+X1MIVzGMmlXw4d0umQaiRtTlhp8W/JqWUNy5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Td8z5VNtZnV8QpLSTIuL/fqrxdIzYaxeXqlNPGy+KLy+1PhAZML8oSspaR+aU+rJf
	 b61QAaikCWLrr2lfSrzwbXCFTq+8Xfg3rX0ebGIVoQtsm3DiOKmbIPICBIcwNUJRd+
	 kkVl/X6cxwMik6SS7oKzSa2Kx5nBRMrxS0U8+Kuc=
Date: Tue, 28 May 2024 07:41:09 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Pavel Machek <pavel@ucw.cz>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 3/4] platform/chrome: cros_kbd_led_backlight: allow
 binding through mfd device
Message-ID: <4b5d7db0-4454-4c69-b2c4-9ad652eade76@t-8ch.de>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
 <ZlVtnF-ZZ72N2PAG@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZlVtnF-ZZ72N2PAG@google.com>

On 2024-05-28 05:37:32+0000, Tzung-Bi Shih wrote:
> On Sun, May 26, 2024 at 08:17:17PM +0200, Thomas Weißschuh wrote:
> > +#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
> [...]
> > +static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
> > +	.init = keyboard_led_init_ec_pwm_mfd,
> > +	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
> > +	.brightness_get = keyboard_led_get_brightness_ec_pwm,
> 
> They are only available if IS_ENABLED(CONFIG_CROS_EC).

config MFD_CROS_EC_DEV
	depends on CROS_EC

Do you prefer this to be spelled out explicitly somewhere?

