Return-Path: <linux-leds+bounces-3317-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C49BEFB7
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 15:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ABED281E62
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 14:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1447E1DF745;
	Wed,  6 Nov 2024 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLSfW0Zm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601E1898E9;
	Wed,  6 Nov 2024 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901682; cv=none; b=TZchN5cN6wYZRtjAR2NpeHf60gj2daLXpgShx3Gwi6qbopmny0/Q5o/Nl8lRLmZs0f1LtYwq0C4IFpjCbJw+EwY9TeYCku0SbuCdMm0o6OePsO0wlWUiGKTPw3mdKEYbmfr+qHkIDUO+AgEBqBBQ5ontFdPe6FrkGNfhzANjRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901682; c=relaxed/simple;
	bh=i7Zmi87D8d0gBokDvVUy3Mhw6AjH4JyV50E/iLattpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9pzRRwOSCAvi1t8JyJFfatn9420GgIMYE1SIXt66aAWwH1JJ/nRKUutPMbXcNjk/jT9d0Op9GC+Q4uNbbljwaeNaqpBiTR6FsIVBoT+hq5aaMSfilYeOsq505E3dCLAzRoLHp5WpYQgIzMucISfc04tULFiM71m9JnhtOg/i+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLSfW0Zm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C02CC4CEC6;
	Wed,  6 Nov 2024 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901681;
	bh=i7Zmi87D8d0gBokDvVUy3Mhw6AjH4JyV50E/iLattpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLSfW0ZmKhSBFzNytPLoYes5edBhcDMGgGcXHbp9rybjrcfOK1/is2f70/32xAnW+
	 ra0v4DJAn2kElKT0TZCwQ28qm4PqsXoHVaufdH8NbuF30p2lvWe4zhtMN37p/DI55t
	 UngKWPjzgi99iOpvdGPvDHInEXeBspMJNSt/IF8B4o1FbCWmkeIQDg/O5oE+HiEidM
	 Kpl2S6UmlAV36QRUi8tCdirwq3I1gWJl0NmQ97AUSGqK1VHujtI61lQfJq6H0wW/r/
	 SI0XpeNvpbGKg18nUv+NS3Hn23+OCXmslNy6Z2UBDpmqVwcxGtOr75LSnzB4ub3iaQ
	 WoIIrLfBBpOWA==
Date: Wed, 6 Nov 2024 15:01:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] [PATCH v3] Documentation:leds: Add leds-st1202.rst
Message-ID: <3dfaukblo37yf3xy3ch2uooi6zcn7owbdigyjwl6jh3zruwr7o@je6tvxnsva2c>
References: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>

On Wed, Nov 06, 2024 at 06:18:07AM +0000, Vicentiu Galanopulo wrote:
> Add usage for sysfs hw_pattern entry for leds-st1202
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
>  - Changes in v3: Add leds-st1202 to index.rst
>  - Changes in v2: Implement review comments
> ---
>  Documentation/leds/index.rst       |  1 +
>  Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/leds/leds-st1202.rst
> 

I don't understand your patch threading and formatting. Why binding is
v4 but this is v3?

Please mark your patches appropriately. Use b4 or git format-patch -v4.
If you use other commands, you can screw things up, so then it is up to
you to create proper sets.

Best regards,
Krzysztof


