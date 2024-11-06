Return-Path: <linux-leds+bounces-3311-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0F9BE4E2
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363E2280B95
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 10:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2C91DE3C2;
	Wed,  6 Nov 2024 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLZwFhBq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFCF1DD525;
	Wed,  6 Nov 2024 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890500; cv=none; b=uOS+HLVE/o5S9dsNBjSW4Vl2/7HjXUolY/Alglh3BofAn6+YrciKdg/dWm/1d3ZwQe+VkVKKq67mwX6b3eZOVPp1m8sDzv39SaCRCAglHtP1k2lV9H+s8mL99B05cVhNy9Q2MTZ8XePRcPUnzELSUsg+/BClL4b1KuKyyPxKB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890500; c=relaxed/simple;
	bh=JzJ2jvVWeRAP+hj95hcIGJu+zeCkaii11+p1DMnnk5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCJ4WOKo5rttdQrIwAOSxPc53YSgmlR4UHuQFPT2z4XRTDCHg2SfSIBM7EU6KHBbZwA8y/F4rxwWc/REqlBYYYiAUD1faqlgeIDcDhWL3XagaMpRYH/dPHf1oxagCWKKgRIdIb9RQxsE4N9kFxBoCapKyd6dy1SzvnwfoW6LeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLZwFhBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D515C4CECD;
	Wed,  6 Nov 2024 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730890500;
	bh=JzJ2jvVWeRAP+hj95hcIGJu+zeCkaii11+p1DMnnk5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLZwFhBqTFsT7DIjmlEAaVVk2YeEJ00EI3QxsgEubH18WHZLRTcOzTg3E1snQn4hD
	 yq9E5XrjyAMmStXBlvindVdaWDB3ZQJJuRRcwRAB6uIEM7c9H8UXf5gtmKVq83LsrH
	 CCx2oay3Y78ESI5g6tiTVvfKBq0kGbeKtAWCJyVDF/nAzmIF9/tp9Q7xW0b1FxK6qv
	 7kXn5WwOddhgS5ndHNA5s6ryr6T7/UTkyNClaA+YGmaPMKFALa62UjDrdp8fKrIcpN
	 iBMc7n3KBPdtYvF10hWll2slpe7wEMIqwdL6/3we089+PCgel2IPkZB8AtcERX0+gH
	 qY5FBvQkQq34A==
Date: Wed, 6 Nov 2024 10:54:55 +0000
From: Lee Jones <lee@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [RESEND PATCH v2 0/2] leds: pwm: Add default-brightness property
Message-ID: <20241106105455.GQ1807686@google.com>
References: <20241105185006.1380166-1-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105185006.1380166-1-gnstark@salutedevices.com>

On Tue, 05 Nov 2024, George Stark wrote:

> led-pwm driver supports default-state DT property and if that state is on then
> the driver during initialization turns on the LED setting maximum brightness.
> Sometimes it's desirable to use lower initial brightness.
> This patch series adds support for DT property default-brightness.
> 
> Things to discuss:
> If such a property is acceptable it could be moved to leds/common.yaml due to
> several drivers support multiple brightness levels and could support the property
> too.
> 
> Changes in v2:
>   leds: pwm: Add optional DT property default-brightness
>     - refactor patch to make it more accurate
>   link to v1: [1]
> 
> [1] https://lore.kernel.org/lkml/20241015151410.2158102-3-gnstark@salutedevices.com/T/
> 
> George Stark (2):
>   dt-bindings: leds: pwm: Add default-brightness property
>   leds: pwm: Add optional DT property default-brightness
> 
>  .../devicetree/bindings/leds/leds-pwm.yaml      |  6 ++++++
>  drivers/leds/leds-pwm.c                         | 17 ++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)

The set doesn't apply.  Please rebase it.

-- 
Lee Jones [李琼斯]

