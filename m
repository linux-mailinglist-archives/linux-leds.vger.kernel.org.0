Return-Path: <linux-leds+bounces-3318-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054689BEFBE
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 15:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2C52820B5
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 14:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3163D201116;
	Wed,  6 Nov 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVDIRaBL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C75188CC9;
	Wed,  6 Nov 2024 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901749; cv=none; b=dtCYcXgKwZ/IJcuYvNGcoheGWn/J5f3a8gx2scfUt4/vSTa3LC/6c53BKsogTr8WFhzAhNMWqsOkNaL22vKV8Kaf8sbYfdQNWtIaRt0tBkzPb08oJnFGEu2CsdHTHMW/UI9o2cVlSu0rGCYREX2ePuKq1CWPqVU99gsdJAGKT0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901749; c=relaxed/simple;
	bh=/FKciTcW80Woxl5rG3QH5J1wGHkVKx3o/SXZ9vV/a8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZxcUufCnYqoaTnAnpbkulLewt2D/1yXalYslCI4cGtHHqeIrAri7HJYy+kFqOHJkn8irnw5lQbO6hQV+WUzOE8gPpSpgwiKxRJF4NcUkVGnGh7KYiNEmbstxASANC6s5YB0mxieEOkgGX80YtkV+xv+fCvxPJTnHrbyT8VahUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVDIRaBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B109EC4CECC;
	Wed,  6 Nov 2024 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901746;
	bh=/FKciTcW80Woxl5rG3QH5J1wGHkVKx3o/SXZ9vV/a8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVDIRaBL8kXAceC7CZtmsFsNPKpBCUDPEhqhOtZDnGRT1L+z4yfD9cnzY3Z+0eln4
	 gS4MNoUQzgPpsDzFEVp/dtRsimGCp/pmyrL42B97ry9HCRiRQ/xL8N0CiZ5ZyJZSbd
	 sPRBZi0fkqh6IFZtdoi7/lKR5cLjpZYWKtRoXPce8AHFpHbvwxXd5K0N16KvZ4N/fy
	 A6PJSNurVY6DDMUlXRbdnTQf7DjOzJxGxA3G5fdoAf3zAkI58KOSX5sQT5kKPzKq0d
	 AhTM45E86u3uW9/8+cjUJ6wRv4TrOXr9J58Avmi7D7kiEwEwUXnF98hg266LfCEo77
	 +57ifc0DPp8yw==
Date: Wed, 6 Nov 2024 15:02:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] [PATCH v4] dt-bindings: leds: Add LED1202 LED
 Controller
Message-ID: <z2msksz2aso4mip57mlyecxaiyqrcyy4e7dh6w6mdy33mevnpb@wgx7anub3qmn>
References: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk>

On Wed, Nov 06, 2024 at 06:18:08AM +0000, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> If the led node is present in the controller then the channel is
> set to active.
> 
> v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
> v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
> v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>

Really, try by yourself:

b4 diff 20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk
Works? No. Should work? Yes and tools make it working, don't re-invent
the process.

Best regards,
Krzysztof


